{pkgs, ...}: let
  example = "thing";
in {
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 14;
      };
      colors.draw_bold_text_with_bright_colors = true;
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };
}
