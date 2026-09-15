{config, lib, pkgs, dotfiles, inputs, ...}:

{
imports = 
[
  inputs.home-manager.nixosModules.home-manager
];

security.pam.makeHomeDir.skelDirectory = "/etc/skel";

home-manager = {
useUserPackages = true;
useGlobalPkgs = true; 
backupFileExtension = "backup" ;
extraSpecialArgs = {inherit dotfiles;};
users.sss = import ./home.nix;
};

}
