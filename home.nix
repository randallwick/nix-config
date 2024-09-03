{ config, pkgs, ... }:

{
  home.username = "randall";
  home.homeDirectory = "/home/randall";

  home.packages = with pkgs; [
    # flash
    fastfetch

    # terminal nav
    eza
    fzf
    vifm-full

    # archives
    zip
    unzip
    xz
    p7zip
    zstd

    # search
    ripgrep
    jq
    yq-go

    # shell
    file
    which
    tree
    gnused
    gnutar
    gawk
    gnupg
    tldr

    # networking
    mtr
    iperf3
    dnsutils
    ldns
    aria2
    socat
    nmap
    ipcalc

    # nix
    nix-output-monitor

    # monitoring
    btop
    iotop
    iftop

    # system call monitoring
    strace
    ltrace
    lsof

    # system tools
    sysstat
    lm_sensors
    ethtool
    pciutils
    usbutils
  ];

  programs.git = {
    enable = true;
    userName = "Randall Wick";
    userEmail = "randy.wick@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.starship = {
    enable = true;
  };

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

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -lah";
      vim = "nvim";
      vi = "nvim";
      update = "sudo nixos-rebuild switch";
    };

    history = {
      size = 10000;
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } 
      ];
    };
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
