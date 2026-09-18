{config, lib, pkgs, ...}:{

networking = {
  nameservers = ["185.228.168.168" "185.228.169.168"];
  hostName = "nixos";
  networkmanager.enable = true;
  firewall.enable = false;
};
	

}
