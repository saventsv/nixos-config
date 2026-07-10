{ config, pkgs, ... }:
{
  services.syncthing = {
    enable = true;
    user = "saven";
    dataDir = "/home/saven";
    configDir = "/home/saven/.config/syncthing";
  };
}
