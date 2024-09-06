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

    settings = {
      background_opacity = "0.7";
      copy_on_select = "yes";
      enable_audio_bell = "no";
      shell = "zsh";
      editor = "nvim";
    };

		shellIntegration = {
			enableZshIntegration = true;
		};
  };
}
