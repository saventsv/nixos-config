{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vscodium
    kitty
  ];

  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    gwenview
    okular
    kate
    ark
    spectacle
    elisa
    khelpcenter
  ];
}
