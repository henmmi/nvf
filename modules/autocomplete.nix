{
  vim.autocomplete = {
    nvim-cmp = {
      enable = true;
      setupOpts = {
        fuzzy.implementation = "prefer_rust_with_warning";
      };
    };
    # blink-cmp = {
    #   enable = true;
    #   setupOpts = {
    #     fuzzy.implementation = "prefer_rust_with_warning";
    #   };
    # };
  };
}
