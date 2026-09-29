{
  vim.languages.csharp = {
    enable = true;
    format.enable = true;
    lsp = {
      enable = true;
      servers = [ "roslyn-ls" ];
    };
    treesitter.enable = true;
  };
}
