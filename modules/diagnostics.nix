{
  vim.diagnostics = {
    enable = true;
    config = {
      virtual_text = true;
      virtual_lines = false;
      signs = true;
      update_in_insert = true;
      float = {
        border = "rounded";
        source = "always";
      };
    };
    nvim-lint = {
      enable = true;
    };
  };
}
