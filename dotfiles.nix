{pkgs, libs, ...}: 

let
	dotfiles = pkgs.fetchFromGitHub {
		owner ="vugtsqsvgv";
		repo ="Dot-Files";
		rev ="main";
		hash ="sha256-27Pki8RUl1Yxj/wuCiGbM75g49PeIlkyWrnMa1IrmF4";

	};


in
{
system.activationScripts.skel-dotfiles = "

	mkdir -p /etc/skel
	cp -rT ${dotfiles} /etc/skel
	chmod -R u+rwX /etc/skel

";


}
