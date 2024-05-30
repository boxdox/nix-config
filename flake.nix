{
  description = "nix and dots";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, catppuccin, ... }@inputs:
  let
    username = "boxdox";
    hostname = "tuf";
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit hostname username inputs; };
      modules = [ 
        ./configuration.nix 
	
	# hardware config for laptop
        nixos-hardware.nixosModules.asus-fx504gd
	nixos-hardware.nixosModules.common-pc-laptop-ssd

	# home-manager as a module
	home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
	  home-manager.extraSpecialArgs = { inherit inputs username; };
	  home-manager.users."${username}".imports = [
            ./home.nix
	    catppuccin.homeManagerModules.catppuccin
	  ];
	}
      ];
    };
  };
}
