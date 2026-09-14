{ pkgs, ... }:
{
  imports = [
    ./rust.nix
    ./typescript.nix
    ./web.nix
  ];

  vim = {
    extraPackages = with pkgs; [ oxfmt ];

    lsp = {
      enable = true;
      formatOnSave = true;
      inlayHints.enable = true;
      lightbulb.enable = true;
      lspconfig = {
        enable = true;
      };
      # Adds clear iconography layer to nvim completion ui.
      lspkind.enable = true;
      nvim-docs-view.enable = true;
      trouble.enable = true;
      mappings.codeAction = "<leader>ca";
      # Show function signature when you type.
      lspSignature.enable = true;

      presets.tailwindcss-language-server.enable = true;

      servers = {
        "taplo" = {
          enable = true;
          cmd = [
            "taplo"
            "lsp"
            "stdio"
          ];
          args = [
            "format"
            "--option"
            "align_entries=true"
            "-"
          ];

          filetypes = [ "toml" ];
        };

        "ron_lsp" = {
          enable = true;

          filetypes = [ "ron" ];
        };

        "oxfmt" = {
          enable = true;
        };
      };
    };

    languages = {
      enableTreesitter = true;
      enableFormat = true;
      nix = {
        enable = true;
        lsp = {
          enable = true;
          servers = [ "nixd" ];
        };
        treesitter.enable = false;
        format = {
          enable = true;
          type = [ "nixfmt" ];
        };
        extraDiagnostics = {
          enable = true;
          types = [ "deadnix" ];
        };
      };

      lua.lsp.lazydev.enable = true;

      # Enable markdown LSP.
      markdown = {
        enable = true;
        format.enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };
      # Enable YML LSP.
      yaml = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };

      # Enable Python LSP
      python = {
        enable = true;
        lsp = {
          enable = true;
          servers = [ "pyright" ];
        };
        treesitter.enable = true;
      };

    };
  };
}
