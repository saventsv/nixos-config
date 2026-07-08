{ config, pkgs, inputs, ... }:
{
  programs.mangowc.enable = true;
  environment.systemPackages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
