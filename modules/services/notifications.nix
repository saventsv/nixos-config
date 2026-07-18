{ config, pkgs, ... }:
{
  services.dunst = {
    enable = true;
    enableX11 = true;
    enableWayland = true;
  };
}
