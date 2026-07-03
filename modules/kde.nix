{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vscodium
  ];

  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    dolphin
    gwenview
    okular
    kate
    ark
    spectacle
    elisa
    khelpcenter
  ];
}
