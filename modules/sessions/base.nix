{ ... }:
{
  imports = [
    ../services/audio.nix
    ../services/bluetooth.nix
    ../services/syncthing.nix
    ../services/notifications.nix
    ./display-manager.nix
  ];
}
