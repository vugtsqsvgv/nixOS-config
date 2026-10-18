{pkgs, ...}:

let
  # Fetch a specific revision of nixpkgs where the desired Blender version is available.
  # Replace 'rev' with the commit hash for your target Blender version.
  blenderPkgs = import (builtins.fetchGit {
    name = "nixpkgs-blender-3.6.0"; # A descriptive name for clarity
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixos-24.11"; # Use the branch that contains the commit
    rev = "81b970640e56a5c07a336d2c05018b0c9bf57a51"; # Example commit hash
  }) {};

  androidPkgs = import (builtins.fetchGit {
    name = "nixpkgs-android-studio-2026.1.4.8";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixos-unstable";
    rev = "ae5fe741ba9acade281a9185139e3922811c9696"; # Example commit for Blender
  }) {};

in

{
environment.systemPackages = with pkgs; [
  neovim
  wget
  git
  kitty
  yazi
  vimPlugins.LazyVim
  oh-my-zsh
  zsh
  zsh-powerlevel10k
  quickshell
  zoxide
  gcc
  fzf
  rofi # -wayland
  github-cli
  awww
  hyprshade
  xfce4-whiskermenu-plugin
  keepassxc
  libreoffice
  rclone
  syncthing
  fuse
  fuse3
  auto-cpufreq
  hyprshot
  cliphist
  wl-clipboard
  nwg-look
  tlp
  nodejs
  blenderPkgs.blender
  androidPkgs.android-studio
  electron
  krita
  telegram-desktop
  waydroid
];

fonts.packages = with pkgs; [

	nerd-fonts.jetbrains-mono


];


programs= {
  firefox.enable = true;
  fuse = {

	enable = true;
	userAllowOther = true;

  };
  kdeconnect.enable = true;
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

}
