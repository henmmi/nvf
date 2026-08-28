{ pkgs, ... }:
{
  vim = {
    lazy = {
      enable = true;
      enableLznAutoRequire = true;
      loader = "lz.n";
      plugins = {
        nvim-nio = {
          package = pkgs.vimPlugins.nvim-nio;
          lazy = true;
        };

        "plenary.nvim" = {
          package = pkgs.vimPlugins.plenary-nvim;
          lazy = true;
        };

        "smear-cursor.nvim" = {
          package = pkgs.vimPlugins.smear-cursor-nvim;
          setupOpts = {
            smear_between_buffers = true;
            smear_between_neighbor_lines = true;
            scroll_buffer_space = true;
            legacy_computing_symbols_support = false;
            smear_insert_mode = true;
          };

        };

      };
    };

    startPlugins = [
      "rustaceanvim"
      "nvim-dap"
    ];

    # luaConfigRC.rustaceanvim = ''
    #   server = {
    #     settings = {
    #       ["rust-analyzer" ] = {
    #         checkOnSave = {
    #           command = "clippy",
    #         },
    #       },
    #     },
    #   }
    # '';

    extraPlugins = {
      treesitter-rust = {
        package = pkgs.vimPlugins.nvim-treesitter-parsers.rust;
      };
      treesitter-ron = {
        package = pkgs.vimPlugins.nvim-treesitter-parsers.ron;
      };
      ron-vim = {
        package = pkgs.vimPlugins.ron-vim;
      };
      neotest = {
        package = pkgs.vimPlugins.neotest;
        setup = ''
          require('neotest').setup {
            adapters = {
                require('rustaceanvim.neotest')
              },
            }
        '';
        after = [ "rustaceanvim" ];
      };
    };
  };
}
