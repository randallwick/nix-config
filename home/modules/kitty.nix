{pkgs, ...}: let
  example = "thing";
in {
  programs.kitty = {
    enable = true;
    theme = "LiquidCarbonTransparent";
  };
}
