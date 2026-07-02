{ config, pkgs, ... }: 
{
  services.xserver.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };
}
