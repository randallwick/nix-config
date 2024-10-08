{pkgs, ...}:
{
  programs.awscli = {
    enable = true;
    settings = {
      region = "us-east-1";
      output = "yaml";
    };
  };
}
