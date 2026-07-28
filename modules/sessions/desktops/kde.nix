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
  dolphin
  dolphin-plugins
  konsole
  kolourpaint
  kate
  ark
  spectacle
  elisa
  khelpcenter
  kwallet
  kwalletmanager
  kamoso
  kget
  ktorrent
  kpat
  kdeconnect-kde
];

}
