{
  vim.languages = {
    html = {
      enable = true;
      extraDiagnostics.enable = true;
      format.enable = true;
      lsp.enable = true;
    };

    css = {
      enable = true;
      format.enable = false;
      lsp.enable = true;
      treesitter.enable = true;
    };

    json = {
      enable = true;
      format.enable = false;
      lsp = {
        enable = true;
        servers = [ ];
      };
      treesitter.enable = true;
    };
  };
}
