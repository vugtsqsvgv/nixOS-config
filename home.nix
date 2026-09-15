{config,dotfiles , pkgs, ... }:{

home.username = "sss";
home.homeDirectory = "/home/sss";
home.stateVersion = "26.05";

home.file = {
".config/hypr".source = "${dotfiles}/.config/hypr";
".config/quickshell".source = "${dotfiles}/quickshell";
".zshrc".source = "${dotfiles}/.zshrc";
".p10k.zsh".source = "${dotfiles}/.p10k.zsh";
".config/nvim".source = "${dotfiles}/.config/nvim";
".config/kitty".source = "${dotfiles}/.config/kitty";
".config/rofi".source = "${dotfiles}/.config/rofi";

};
}
