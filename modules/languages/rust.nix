{ pkgs, lib, ... }:
{
  vim.languages.rust = {
    enable = true;

    # Let nvf manage both rust-analyzer split profiles.
    lsp.enable = true;
    dap.enable = false;

    format = {
      enable = true;
      type = [ "rustfmt" ];
    };

    treesitter = {
      enable = true;
      package = pkgs.vimPlugins.nvim-treesitter-parsers.rust;
    };

    extensions.crates-nvim.enable = true;
  };
  vim.lsp.servers.rust-analyzer = {
    cmd = lib.mkForce [
      "rust-analyzer-split"
      "--profile"
      "native"
    ];
    settings.rust-analyzer = {
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

  vim.luaConfigRC.rust-analyzer-wasm = lib.nvim.dag.entryAfter [ "lsp-servers" ] ''
    vim.lsp.config["rust-analyzer-wasm"] = vim.tbl_deep_extend(
      "force",
      vim.lsp.config["rust-analyzer"],
      { cmd = { "rust-analyzer-split", "--profile", "wasm" } }
    )
    vim.lsp.enable("rust-analyzer-wasm")
  '';
}
