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
  nerd-fonts.jetbrains-mono
  gcc
  fzf
  rofi # -wayland
#  megasync
  github-cli

];

}
