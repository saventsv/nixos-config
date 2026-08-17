{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    thunar
    papirus-icon-theme
    lxappearance
    # everforest-gtk-theme
    orchis-theme
    # kdePackages.breeze-gtk
  ];
}
