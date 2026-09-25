{config, lib, pkgs, ...}:{

services = {
 openssh.enable = true;
 tlp.enable = true ;
 auto-cpufreq.enable = true;
 envfs.enable = true;
 displayManager.sddm = {
 enable = true;
 wayland.enable = true;
 };
 pipewire = {

	enable = true;
	pulse.enable = true;


 };
 xserver = {

	enable = true;
	desktopManager = {

		xfce.enable = true;

	};

 };
};
	

}
