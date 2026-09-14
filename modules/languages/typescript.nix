{
  vim.languages = {
    # Enable JavaScript/TypeScript LSP.
    typescript = {
      enable = true;
      # Defer to conform to set the formatter.
      format.enable = false;
      lsp = {
        enable = true;
        servers = [ "typescript-go" ];
      };
      treesitter.enable = true;
      extraDiagnostics.enable = true;
    };

    # Enable JSX/TSX LSP.
    tsx = {
      enable = true;
      # Defer to conform to set the formatter.
      format.enable = false;
      lsp = {
        enable = true;
        servers = [ "typescript-go" ];
      };
      treesitter.enable = true;
      extraDiagnostics.enable = true;
    };
  };
}
