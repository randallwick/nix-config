{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-24.05 branch here
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix/release-24.05";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs = { 
    self,
    nixpkgs,
    home-manager,
    sops-nix,
    stylix,
    ...
  } @inputs: let 
      inherit (self) outputs;
      system = "x86_64-linux";
    in {
    nixosConfigurations.stilicho = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs outputs; };
      modules = [
        ./machines/stilicho/configuration.nix

        sops-nix.nixosModules.sops

        stylix.nixosModules.stylix
        ./users/randall/stylix.nix

	      home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.randall = import ./home.nix;
        }
      ];
    };

    overlays = import ./overlays {inherit inputs;};
  };
}
