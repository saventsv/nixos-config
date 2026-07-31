{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wl-clipboard
    waybar
    swaybg
    hyprshot
    rofi
    alacritty
  ];
  programs.xwayland.enable = true;
}
