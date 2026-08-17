{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    thunar
    papirus-icon-theme
    lxappearance
    # everforest-gtk-theme
    graphite-gtk-theme
    # kdePackages.breeze-gtk
  ];
}
