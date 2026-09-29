{
  pkgs,
  ...
}:
{
  imports = [
    ./diagnostics.nix
    ./languages
    ./telescope.nix
    ./autocomplete.nix
    ./utility.nix
    ./git.nix
    ./keymap.nix
    ./formatter.nix
    ./plugins.nix
    ./theme.nix
    ./treesitter.nix
    ./status_line.nix
  ];

  vim = {
    syntaxHighlighting = true;
    # Theme lives in ./theme.nix

    options = {
      # Terminal and Title Settings
      title = true;
      titlestring = "%t";

      # Indentation and Formatting Settings
      tabstop = 2;
      shiftwidth = 2;
      autoindent = true;
      smarttab = true;
      softtabstop = 2;

      # Search and Case Settings
      hlsearch = true;
      ignorecase = true;
      smartcase = true;
      smartindent = true;

      # Line Number Settings
      number = true;

      # Display Settings
      cursorline = true;
      expandtab = true;
      mouse = "a";
      showcmd = true;
      timeoutlen = 300;
      wildmenu = true;
      wrap = true;
      completeopt = "menuone,noselect";
      updatetime = 50;
      scrolloff = 5;
      signcolumn = "yes";

      # List and Match Settings
      list = true;

      # GUI and Encoding Settings
      termguicolors = true;
      encoding = "utf-8";

      # Other, shada and swap file disable
      shadafile = "NONE";
      swapfile = false;
    };

    ui.colorful-menu-nvim.enable = true;
    clipboard = {
      enable = true;
      providers.wl-copy.enable = pkgs.stdenv.hostPlatform.isLinux;
      registers = "unnamedplus";
    };

    autopairs.nvim-autopairs.enable = true;

    ui.borders.globalStyle = "rounded";

    binds.whichKey.enable = true;
    ui.borders.plugins.which-key.enable = true;
    ui.fastaction = {
      enable = true;
      setupOpts = {
        window = {
          relative = "cursor";
        };
        popup = {
          relative = "cursor";
        };
      };
    };
    ui.borders.plugins.fastaction = {
      enable = true;
    };

    visuals = {
      fidget-nvim.enable = true;
    };

    debugger.nvim-dap.enable = true;

  };
}
