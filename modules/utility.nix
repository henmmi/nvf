{
  vim = {
    notes = {
      todo-comments = {
        enable = true;
        mappings = {
          telescope = "<leader>tds";
        };
      };
    };
    utility = {
      # Enable syncing nvim shell environment with direnv
      direnv.enable = true;
      oil-nvim = {
        enable = true;
        setupOpts = {
          float = {
            padding = 2;
            max_width = 0;
            max_height = 0;
            border = "rounded";
            win_options = {
              winblend = 10;
            };
          };
        };
      };
      # Enable image support
      # images.image-nvim.enable = true;
      snacks-nvim.enable = true;
      diffview-nvim.enable = true;
    };
  };
}
