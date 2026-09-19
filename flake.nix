{
  description = "Henry's nvf (neovim) configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "git+https://github.com/NotAShelf/nvf?ref=release/26.07";
    rust-analyzer-split = {
      url = "path:/home/henry/rust-analyzer-split";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nvf,
      rust-analyzer-split,
    }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});

      # The bare nvf configuration: modules that set `vim.*` options.
      config =
        { pkgs, ... }:
        {
          imports = [ ./modules ];

          vim.extraPackages = [
            (pkgs.rustPlatform.buildRustPackage {
              pname = "rust-analyzer-split";
              version = "0.1.0";
              src = rust-analyzer-split;
              cargoLock.lockFile = "${rust-analyzer-split}/Cargo.lock";
            })
          ];
        };

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
