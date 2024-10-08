{ config, pkgs, ... }:

{
  imports = [
    ./home/modules/common.nix
  ];

  home.username = "randall";
  home.homeDirectory = "/home/randall";

  home.packages = with pkgs; [
    # flash
    fastfetch

    # terminal nav
    base16-shell-preview
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

    # security
    age

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

    # gui
    xfce.thunar
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
