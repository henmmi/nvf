{ lib, ... }:
{
  vim = {
    statusline.lualine = {
      enable = true;
      theme = lib.mkForce "auto";
    };

    tabline.nvimBufferline = {
      enable = true;
      setupOpts = {
        options = {
          separator_style = "slant";
          numbers = "none";
          diagnostics = "nvim_lsp";
        };
      };
    };
  };
}
