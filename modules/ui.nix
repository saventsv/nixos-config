{pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    quickshell
    nerd-fonts.iosevka
  ];
}

