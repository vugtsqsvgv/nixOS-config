{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./packages.nix
      ./home-manager.nix
      ./clean-up.nix
#      ./dotfiles.nix
    ];
	#unfree
	nixpkgs.config.allowUnfree = true;


	security.pam.makeHomeDir.skelDirectory = "/etc/skel";

    #flakes

    nix.settings.experimental-features = ["nix-command" "flakes"];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/vda";

  networking.hostName = "nixos";

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
   time.timeZone = "Africa/Algeria";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  # font = "Lat2-Terminus16";
  # keyMap = "fr";
  # useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  
  # services.pulseaudio.enable = true;
 
   services.pipewire = {
     enable = true;
     pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

 users.users.sss = {
   isNormalUser = true;
   extraGroups = [ "wheel" ];
   packages = with pkgs; [
   ];
};

 users.defaultUserShell = pkgs.zsh;
 environment.shells = [pkgs.zsh];

  programs= {
  firefox.enable = true;
  hyprland.enable = true;
  git.enable = true;
  zsh = {
	enable = true;
	ohMyZsh = {
	enable = true;
	plugins = ["git"];
	};
	promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

  };

  };
 
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

 services = {
 openssh.enable = true;
 envfs.enable = true;
 displayManager.sddm = {
 enable = true;
 wayland.enable = true;
};
 };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

system.stateVersion = "26.05";

}

