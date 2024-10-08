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
    nix-secrets = {
      url = "git+ssh://git@github.com/randallwick/nix-secrets?shallow=1&ref=main";
      flake = false;
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
    in {
    system = "x86_64-linux";
    nixosConfigurations.stilicho = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs outputs; };
      modules = [
        ./machines/stilicho/configuration.nix

        stylix.nixosModules.stylix
        ./users/randall/stylix.nix

        sops-nix.nixosModules.sops

	      home-manager.nixosModules.home-manager
        {
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.randall = import ./home.nix;
        }
      ];
    };

    overlays = import ./overlays {inherit inputs;};
  };
}
