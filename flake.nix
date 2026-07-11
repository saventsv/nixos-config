{
  description = "My NixOS configuration";


  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, noctalia, ... }:
  {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
        inherit inputs;
      };

      modules = [
        ./hosts/laptop/configuration.nix
        {
          nixpkgs.config.permittedInsecurePackages = [
            "pnpm-10.29.2"
            "ventoy-1.1.12"
          ];
        }
      ];
    };
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./hosts/desktop/configuration.nix
        {
          nixpkgs.config.permittedInsecurePackages = [
            "pnpm-10.29.2"
            "ventoy-1.1.12"
          ];
        }
      ];
    };
  };
}
