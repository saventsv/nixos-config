{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rustlings
  ];
}
