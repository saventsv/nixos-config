{ ... }:
{
  imports = [
    ../services/audio.nix
    ../services/bluetooth.nix
    ../services/syncthing.nix
    ../services/notifications.nix
    ../programs/keepassxc.nix
    ../programs/browser.nix
    ../programs/work.nix
    ./display-manager.nix
    ./fonts.nix
  ];
}
