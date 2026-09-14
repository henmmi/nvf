{ pkgs, ... }:
{
  vim.languages.rust = {
    enable = true;

    # Rustaceanvim manages rust-analyzer and its DAP adapter itself.
    lsp.enable = false;
    dap.enable = false;

    format = {
      enable = true;
      type = [ "rustfmt" ];
    };

    treesitter = {
      enable = true;
      package = pkgs.vimPlugins.nvim-treesitter-parsers.rust;
    };

    extensions = {
      crates-nvim.enable = true;

      rustaceanvim = {
        enable = true;
        setupOpts.server.default_settings."rust-analyzer" = {
          # Keep feature-gated modules in rust-analyzer's crate graph.
          cargo = {
            features = "all";
            targets = "all";
          };
          checkOnSave = true;
          check.command = "clippy";
          inlayHints.chainingHints.enable = false;
        };
      };
    };
  };
}
