{pkgs, ...}: let
  example = "thing";
in {
  programs.kitty = {
    enable = true;
    theme = "Liquid Carbon Transparent";
		font = {
			name = "FiraCode";
			size = 14;
		};

		shellIntegration = {
			enableZshIntegration = true;
		};
  };
}
