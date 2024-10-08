{config, inputs, pkgs, ...}: let
  secretspath = builtins.toString inputs.nix-secrets;
in 
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    defaultSopsFile = "${secretspath}/secrets.yaml";
    defaultSopsFormat = "yaml";
    defaultSymlinkPath = "/run/user/1000/secrets";
    defaultSecretsMountPoint = "/run/user/1000/secrets.d";
    age.keyFile = "/home/randall/.config/sops/age/keys.txt";

    secrets = {
      aws_access_key_id = { };
      aws_secret_access_key = { };
    };
  };

}
