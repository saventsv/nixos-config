{ config, pkgs, ... }:
{
  services.desktopManager.gnome.enable = true;
  programs.dconf.enable = true;
  environment.variables = {
    GSK_RENDERER = "ngl";
  };
}
