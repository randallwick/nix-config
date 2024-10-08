{ pkgs, ... }:
{
  stylix = {
    enable = true;
    image = ../../static/wallpapers/cherry-blossom.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/helios.yaml";
    cursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-dark";
      size = 32;
    };
    polarity = "dark";
    fonts = {
      monospace = {
        package = (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; });
        name = "FiraCode Nerd Font Mono";
      };
      sizes = {
        terminal = 14;
      };
    };
    opacity = {
      terminal = 0.85;
    };
    targets = {
      gtk.enable = true;
    };
  };
}
