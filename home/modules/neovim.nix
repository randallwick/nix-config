{pkgs, ...}: let
  neovim_config = ../../static/config/nvim;
in {
  programs.neovim = {
    enable = true;
    package = pkgs.unstable.neovim-unwrapped;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
    vimAlias = true;
    viAlias = true;

    extraPackages = with pkgs.unstable; [
      alejandra
      lua-language-server
      markdownlint-cli
      nixd
      nodePackages.bash-language-server
      nodePackages.prettier
      shellcheck
      shfmt
      stylua
      vscode-langservers-extracted
      yaml-language-server
    ];
  };

  # source lua config from this repo
  xdg.configFile = {
    nvim = {
      source = "${neovim_config}";
      recursive = true;
    };
  };
}
