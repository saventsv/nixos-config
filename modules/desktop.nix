{ ... }:
{
  imports = [
    ./services/audio.nix
    ./services/bluetooth.nix
    ./services/syncthing.nix
    ./services/notifications.nix
    ./programs/keepassxc.nix
    ./programs/browser.nix
    ./programs/work.nix
    ./programs/thunar.nix
    ./sessions/display-manager.nix
    ./sessions/fonts.nix
  ];
}
