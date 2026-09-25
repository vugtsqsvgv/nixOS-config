{pkgs, ...}:
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
  megasync
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
