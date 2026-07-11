{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    talosctl
  ];
}
