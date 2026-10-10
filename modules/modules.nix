{ config, lib, pkgs, ... }:{

imports = [

	./clean-up.nix
	./packages.nix
	./grub.nix
	./services.nix
	./users.nix
	./network.nix
  ./npm.nix
  #./whisper.nix
];

}
