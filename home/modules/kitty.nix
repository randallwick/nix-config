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
      background_opacity = "0.8";
      copy_on_select = "yes";
      editor = "nvim";
      enable_audio_bell = "no";
      hide_window_decorations = "yes";
      shell = "zsh";
      tab_bar_style = "powerline";
      window_padding_width = 5;
    };

		shellIntegration = {
			enableZshIntegration = true;
		};
  };
}
