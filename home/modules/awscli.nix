{config, pkgs, ...}:
{
  programs.awscli = {
    enable = true;
    settings = {
      "default" = {
        region = "us-east-1";
        output = "yaml";
      };
    };
    credentials = {
      "default" = {
        credential_process = "sh -c 'echo \"{ \\\"Version\\\": 1, \\\"AccessKeyId\\\": \\\"$(cat ${config.sops.secrets.aws_access_key_id.path})\\\", \\\"SecretAccessKey\\\": \\\"$(cat ${config.sops.secrets.aws_secret_access_key.path})\\\"}\" | jq -r '";
      };
    };
  };
}
