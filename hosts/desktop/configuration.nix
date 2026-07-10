{ config, pkgs, ... }:

{
  imports = [
    # 1. Include the results of the hardware scan
    /etc/nixos/hardware-configuration.nix

    ../../base.nix
    ../../modules/sessions/base.nix
    ../../modules/sessions/kde.nix
    ../../modules/sessions/xorg.nix
    ../../modules/sessions/dwm.nix
    ../../modules/services/printing.nix
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
