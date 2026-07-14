{ config, pkgs, ... }:
{
  imports = [
    ./fonts.nix
    ./display-manager.nix
    ../services/audio.nix
    ../services/bluetooth.nix
    ../services/syncthing.nix
    ../services/notifications.nix
    ../programs/keepassxc.nix
    ../programs/browser.nix
    ../programs/work.nix
    ../programs/thunar.nix
  ];
}
