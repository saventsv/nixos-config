{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    thunar
    papirus-icon-theme
    lxappearance
    adw-gtk3
    # kdePackages.breeze-gtk
  ];
}
