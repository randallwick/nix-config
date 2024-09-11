{pkgs, lib, ...}:
{
  programs.alacritty = with lib; {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = mkForce 14;
      };

      colors.draw_bold_text_with_bright_colors = true;

      window = {
        decorations = "None";
        opacity = mkForce 0.8;
      };

      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };
}
