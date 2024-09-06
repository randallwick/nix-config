{pkgs, ...}: let
  example = "thing";
in {
  programs.git = {
    enable = true;
  };
}
