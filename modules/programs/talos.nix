{ config, pkgs, ... }:
{
  evironment.systemPackages = with pkgs; [
    talosctl
  ];
}
