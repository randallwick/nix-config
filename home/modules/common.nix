{outputs, ...}: {
  imports = [
		./alacritty.nix
		./awscli.nix
		./git.nix
#    ./hyprland.nix
    ./kitty.nix
		./nerdfonts.nix
    ./neovim.nix
		./starship.nix
		./secrets.nix
		./zsh.nix
  ];
}
