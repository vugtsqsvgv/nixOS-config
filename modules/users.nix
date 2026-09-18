{config, lib, pkgs, ...}:{

users = {
 defaultUserShell = pkgs.zsh;
 users.sss = {
   isNormalUser = true;
   extraGroups = [ "wheel" ];
   packages = with pkgs; [
   ];
};
};

environment.shells = [pkgs.zsh];


}
