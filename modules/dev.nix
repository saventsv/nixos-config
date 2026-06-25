{pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    go
    gcc
    gnumake
    maven
    python3
    nodejs
  ];
  programs.java.enable = true;
}
