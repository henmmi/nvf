{
  lib,
  pkgs,
  ...
}:
let
  inherit (lib.nvim.dag) entryBefore;

  # Omarchy's "Miasma" theme. Its neovim.lua points at this plugin:
  # https://github.com/OldJobobo/omarchy-miasma-theme/blob/master/neovim.lua
  #
  # NOTE: nixpkgs has `vimPlugins.miasma-nvim`, but that is xero's original,
  # a single vimscript file with no lualine theme and no modern Diagnostic/
  # treesitter groups. The Omarchy theme uses OldJobobo's maintained Lua
  # rewrite, which is what we build here.
  miasma-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "miasma.nvim";
    version = "0-unstable-2026-03-27";
    src = pkgs.fetchFromGitHub {
      owner = "OldJobobo";
      repo = "miasma.nvim";
      rev = "466456f08d1a114c983c0d24e8fc01339e3b0a27";
      hash = "sha256-s/B8N8v70AALS6kjbkMUfn9FOBVrjq3hgvcNVjYQHvE=";
    };
  };
in
{
  vim = {
    # nvf's theme module only ships a fixed list of themes, and miasma
    # isn't one of them, so we load the colorscheme ourselves.
    theme.enable = lib.mkForce false;

    startPlugins = [ miasma-nvim ];

    # Must run before plugin setups so plugins pick up the highlight groups.
    luaConfigRC.miasma = entryBefore [ "pluginConfigs" "lazyConfigs" ] ''
      vim.opt.termguicolors = true
      vim.cmd.colorscheme("miasma")
    '';

    # "auto" makes lualine require("lualine.themes." .. vim.g.colors_name),
    # which resolves to the miasma theme shipped inside the plugin.
    statusline.lualine.theme = lib.mkForce "auto";
  };
}
