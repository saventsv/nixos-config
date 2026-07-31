{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../base.nix
    ../modules/sessions/xorg.nix
    ../modules/sessions/wayland.nix
    ../modules/sessions/desktops/dwm.nix
    ../modules/sessions/desktops/mangowc.nix
    # ../modules/sessions/desktops/kde.nix
    ../modules/sessions/desktops/cosmic.nix
    ../modules/programs/talos.nix
    ../modules/services/battery.nix
    ../modules/services/brightness.nix
    ../modules/development/game-dev.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  time.timeZone = "America/Chicago";

  networking.hostName = "nixos";

  system.stateVersion = "26.05"; 
  users.users.saven = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager"]; 
    packages = with pkgs; [
      tree
    ];
  };

  security.sudo.extraConfig = ''
    Defaults pwfeedback
  '';
}
