{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    thunar
    papirus-icon-theme
    lxappearance
  ];
}
