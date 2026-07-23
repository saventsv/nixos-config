{ config, pkgs, ... }:
{
  imports = [
    ./work.nix
    ./thunar.nix
    ./browser.nix
    ./keepassxc.nix
    ./prism.nix
    ./usbimager.nix
    ./media.nix
  ];
}
