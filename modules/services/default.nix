{ config, pkgs, ... }:
{
  imports = [
    ./audio.nix
    ./printing.nix
    ./syncthing.nix
    ./notifications.nix
    ./cursor.nix
  ];
}
