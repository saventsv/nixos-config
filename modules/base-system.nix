{pkgs, config, ...}:
{
  networking.networkmanager.enable = true;
  services.dbus.enable = true;
  programs.nm-applet.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    gammastep
  ];
}

