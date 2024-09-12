{pkgs, ...}: let
  example = "thing";
in {
	home.packages = with pkgs; [
		(nerdfonts.override { fonts = [ "FiraCode" ]; })
	];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [
        "FiraCode Nerd Font Mono"
      ];
    };
  };
}
