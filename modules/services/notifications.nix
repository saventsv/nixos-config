{ config, pkgs, ... }:
{
  services.dunst.enable = true;
  services.dunst.enableX11 = true;
  services.dunst.enableWayland = true;
}
