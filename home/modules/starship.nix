{pkgs, ...}: let
  example = "thing";
in {
  programs.starship = {
    enable = true;
  };
}
