{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wl-clipboard
    swaybg
    hyprshot
    rofi
    alacritty
  ];
}
