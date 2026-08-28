{
  description = "Henry's nvf (neovim) configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "git+https://github.com/NotAShelf/nvf";
  };

  outputs =
    {
      self,
      nixpkgs,
      nvf,
    }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});

      # The bare nvf configuration: modules that set `vim.*` options.
      config = ./modules;

      # Wraps the config so it can be dropped into NixOS / home-manager /
      # nix-darwin without the consumer needing to add nvf as an input.
      mkModule = nvfModule: {
        imports = [ nvfModule ];
        programs.nvf = {
          enable = true;
          settings.imports = [ config ];
        };
      };
    in
    {
      inherit config;

      nixosModules.default = mkModule nvf.nixosModules.nvf;
      homeModules.default = mkModule nvf.homeManagerModules.nvf;
      homeManagerModules.default = self.homeModules.default;
      darwinModules.default = mkModule nvf.darwinModules.default;

      # Standalone neovim, usable without NixOS:
      #   nix run github:apekros/nvf
      packages = forAllSystems (pkgs: rec {
        neovim =
          (nvf.lib.neovimConfiguration {
            inherit pkgs;
            modules = [ config ];
          }).neovim;
        default = neovim;
      });

      formatter = forAllSystems (pkgs: pkgs.nixfmt-tree);
    };
}
