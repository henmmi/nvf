{
  vim.telescope = {
    enable = true;
    setupOpts.defaults = {
      layout_strategy = "horizontal";
      layout_config = {
        horizontal = {
          prompt_position = "top";
          preview_width = 0.65;
        };
        width = 0.85;
        height = 0.85;
        preview_cutoff = 120;
      };
      path_display = ["smart"];
    };
    mappings = {
      lspDefinitions = "gd";
      lspReferences = "grr";
    };

    # extensions = [
    #    {
    #      name = "media-files";
    #      packages = [pkgs.vimPlugins.telescope-media-files-nvim];
    #    }
    # ];
  };
}
