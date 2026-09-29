{
  vim.treesitter = {
    enable = true;
    addDefaultGrammars = true;
    highlight.enable = true;
    # Treesitter indent is ON globally which uses indentexpr to calculate instead of native autoindent.
    indent.enable = false;
  };
}
