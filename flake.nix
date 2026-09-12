{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    musnix.url = "github:musnix/musnix";
  };

  outputs = { self, nixpkgs, ... } @ inputs : {

    nixosConfigurations.mothership = nixpkgs.lib.nixosSystem {
      modules = [
        inputs.musnix.nixosModules.musnix
        ./configuration.nix
      ];
      specialArgs = { inherit inputs; };
    };

  };
}
