{
  description = "4th flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations.unix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules =
        [
          ./configuration/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.coast = import ./home-configuration/default.nix;
            home-manager.backupFileExtension = "home-backup";
          }
        ];
    };
  };
}
