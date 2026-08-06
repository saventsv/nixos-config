{ config, pkgs, inputs, ... }:
{
  programs.mango.enable = true;

  environment.systemPackages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    # noctalia-shell
    # noctalia
  ];
}
