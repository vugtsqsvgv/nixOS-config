{config, lib, pkgs, ...}:{

services = {
 openssh.enable = true;
 tlp = {
    enable = true;
    settings = {
        START_CHARGE_THRESH_BATO = 20;
        STOP_CHARGE_THRESH_BATO = 80;
      };
  };
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
