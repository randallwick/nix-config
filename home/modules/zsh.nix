{pkgs, ...}: let
  example = "thing";
in {
  programs.fzf.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza";
      ll = "eza -lah --icons=auto --classify=auto";
      update = "sudo nixos-rebuild switch";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      mkdir = "mkdir -p";
    };

    history = {
      size = 10000;
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } 
        { name = "chriskempson/base16-shell"; }
      ];
    };

		initExtra = ''
      export BASE16_SHELL="$HOME/.zplug/repos/chriskempson/base16-shell/";
		'';
  };
}
