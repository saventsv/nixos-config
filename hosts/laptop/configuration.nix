{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../base.nix
    ../../modules/sessions/backup.nix
    # ../../modules/sessions/kde.nix
    ../../modules/sessions/xorg.nix
    ../../modules/sessions/xmonad.nix
    ../../modules/sessions/mangowc.nix
    ../../modules/sessions/wayland.nix
    ../../modules/services/printing.nix
    ../../modules/services/battery.nix
    ../../modules/services/brightness.nix
    ../../modules/development/game-dev.nix
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
