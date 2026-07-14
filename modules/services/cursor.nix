{ configs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bibata-cursors
  ];
  services.xsettingsd.enable = true;
}
