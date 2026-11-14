{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/modules.nix
      ./home-manager.nix
    ];
	#unfree
	nixpkgs.config.allowUnfree = true;


	security.pam.makeHomeDir.skelDirectory = "/etc/skel";

    #flakes

    nix.settings.experimental-features = ["nix-command" "flakes"];

    #appimage
    programs.appimage = {
  enable = true;
  binfmt = true;
};


virtualisation.waydroid.enable = true;

virtualisation.waydroid.package = pkgs.waydroid-nftables;

services.geoclue2.enable = true;
location.provider = "geoclue2";

    # Set your time zone.
   time.timeZone = "Africa/Algiers";

system.stateVersion = "26.05";

}

