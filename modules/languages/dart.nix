{ config, lib, ... }:
{
  vim.languages.dart = {
    enable = true;
    lsp.enable = true;
    treesitter.enable = true;
    dap.enable = true;
    flutter-tools.enable = true;
  };

  # nvf emits deprecated lsp.color even when color.enable is false.
  # Omit it entirely; Neovim 0.12+ enables native document colors by default.
  vim.pluginRC.flutter-tools = lib.mkForce (lib.nvim.dag.entryAfter [ "lsp-servers" ] ''
    require('flutter-tools').setup {
      flutter_path = "${config.vim.languages.dart.flutter-tools.flutterPackage}/bin/flutter",
      lsp = {
        capabilities = capabilities,
      },
      debugger = {
        enabled = true,
      },
    }
  '');
}
