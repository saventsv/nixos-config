{ config, pkgs, ... }:
{
  imports = [
    ./work.nix
    ./thunar.nix
    ./fish.nix
    ./browser.nix
    ./keepassxc.nix
    ./usbimager.nix
    ./media.nix
  ];
}
