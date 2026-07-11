{ config, pkgs, ... }:
{
   virtualisation.libvirtd.host.enable = true;
   programs.virt-manager.enable = true;
}
