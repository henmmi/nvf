{ pkgs, ... }:
{
  vim = {
    spellcheck = {
      enable = true;
      languages = [ "en_au" ];
    };
    formatter = {
      conform-nvim = {
        enable = true;
        setupOpts = {
          formatters = {
            rustfmt.enable = true;

            taplo = {
              command = "taplo";
              args = [
                "format"
                "--option"
                "align_entries=true"
                "-"
              ];
            };

          };
          formatters_by_ft = {
            javascript = [ "oxfmt" ];
            javascriptreact = [ "oxfmt" ];
            typescript = [ "oxfmt" ];
            typescriptreact = [ "oxfmt" ];
            json = [ "oxfmt" ];
            json5 = [ "oxfmt" ];
            css = [ "oxfmt" ];
          };

        };
      };
    };
    extraPackages = with pkgs; [
      nixfmt
      oxfmt
      nodejs_24
    ];
  };
}
