{pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    go
    gcc
    make
    maven
    python3
    nodejs
  ];
  programs.java.enable = true;
}
