{ pkgs, ... }:
{
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

      # Enable Rust LSP.
      rust = {
        enable = true;
        dap.enable = true;

        # nvf disables this by default when the LSP is enabled, which leaves
        # formatting to rust-analyzer (and thus to rustfmt being on $PATH).
        format = {
          enable = true;
          type = [ "rustfmt" ];
        };

        lsp = {
          package = [ "rust-analyzer" ];
          opts = ''
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
              },
              checkOnSave = true,
              check = {
                command = "clippy",
              },
              inlayHints = {
                chainingHints = {
                  enable = false,
                },
              },
            },
          '';
        };

        treesitter = {
          enable = true;
          package = pkgs.vimPlugins.nvim-treesitter-parsers.rust;
        };

        extensions = {
          crates-nvim = {
            enable = true;
          };
        };
      };

      lua.lsp.lazydev.enable = true;

      # Enable javascript/typescript LSP.
      typescript = {
        enable = true;
        # Defer to conform to set the formatter
        format.enable = false;
        lsp = {
          enable = true;
          servers = [ "typescript-go" ];
        };
        treesitter.enable = true;
      };

      # Enable jsx/tsx LSP.
      tsx = {
        enable = true;
        # Defer to conform to set the formatter
        format.enable = false;
        lsp = {
          enable = true;
          servers = [ "typescript-go" ];
        };
        treesitter.enable = true;
      };

      # Enable HTML LSP.
      html = {
        enable = true;
        extraDiagnostics.enable = true;
        format.enable = true;
        lsp.enable = true;
      };

      # Enable Cascading Style Sheet LSP.
      css = {
        enable = true;
        format.enable = false;
        lsp = {
          enable = true;
        };
        treesitter.enable = true;
      };

      json = {
        enable = true;
        lsp = {
          enable = true;
          servers = [ ];
        };
        format.enable = false;
        treesitter.enable = true;
      };

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
