{ config, pkgs, ... }:
{
  imports = [
    ./work.nix
    ./thunar.nix
    ./browser.nix
    ./keepassxc.nix
    ./usbimager.nix
    ./media.nix
  ];
}
