{ config, pkgs, ... }:
{
  services.xserver.windowManager.openbox.enable = true;
  environment.systemPackages = with pkgs; [
    dockbarx
  ];
}
