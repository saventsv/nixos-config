{ config, pkgs, inputs, ... }:
{
  programs.mango.enable = true;

  environment.systemPackages = with pkgs; [
    # inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    # # noctalia-shell
    # noctalia
    noctalia
  ];
}
