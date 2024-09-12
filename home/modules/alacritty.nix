{pkgs, lib, ...}:
{
  programs.alacritty = with lib; {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      colors.draw_bold_text_with_bright_colors = true;

      window = {
        decorations = "None";
      };

      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };
}
