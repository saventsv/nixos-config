{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../base.nix
    ../../modules/backup.nix
    ../../modules/work.nix
    ../../modules/battery.nix
    ../../modules/brightness.nix
    ../../modules/game-dev.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  time.timeZone = "America/Chicago";

  networking.hostName = "nixos";

  system.stateVersion = "26.05"; 
  users.users.saven = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; 
    packages = with pkgs; [
      tree
    ];
  };

}
