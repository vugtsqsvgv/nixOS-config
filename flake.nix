{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {

	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";

    };

    dotfiles = {

	url = "github:vugtsqsvgv/Dot-Files/main";
	flake = false;

    };

  };

  outputs = {self, nixpkgs, dotfiles, home-manager, ...}: {
  nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {

	system = "x86_64-linux";
	specialArgs = {inherit dotfiles; inputs = self.inputs;} ;
	modules = [
	./configuration.nix
	./home-manager.nix
	];
    };
  };
}
