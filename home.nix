{config,dotfiles, oh-my-zsh,p10k , pkgs, ... }:{

home.username = "sss";
home.homeDirectory = "/home/sss";
home.stateVersion = "26.05";

home.file = {
".config/hypr".source = "${dotfiles}/.config/hypr";
".config/quickshell".source = "${dotfiles}/.config/quickshell";
".zshrc".source = "${dotfiles}/.zshrc";
".p10k.zsh".source = "${dotfiles}/.p10k.zsh";
".config/nvim".source = "${dotfiles}/.config/nvim";
".config/kitty".source = "${dotfiles}/.config/kitty";
".config/rofi".source = "${dotfiles}/.config/rofi";
"Pictures/Wallpapers".source = "${dotfiles}/Pictures/Wallpapers";
".oh-my-zsh/oh-my-zsh.sh".source = "${oh-my-zsh}/oh-my-zsh.sh";
".oh-my-zsh/custom/themes/powerlevel10k".source = "${p10k}";
".oh-my-zsh/tools".source = "${oh-my-zsh}/tools";
".oh-my-zsh/lib".source = "${oh-my-zsh}/lib";
#".oh-my-zsh/themes".source = "${oh-my-zsh}/themes";
".oh-my-zsh/plugins".source = "${oh-my-zsh}/plugins";
".oh-my-zsh/cache".source = "${oh-my-zsh}/cache";




};
}
