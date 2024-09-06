{pkgs, ...}: let
  example = "thing";
in {
  programs.git = {
    enable = true;
    userName = "Randall Wick";
    userEmail = "randy.wick@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
    aliases = {
      s = "status";
    };
  };
}
