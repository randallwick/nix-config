{pkgs, ...}: let
  example = "thing";
in {
  fonts.fontconfig.enable = true;
	home.packages = with pkgs; [
		(nerdfonts.override { fonts = [ "FiraCode" ]; })
	];
}
