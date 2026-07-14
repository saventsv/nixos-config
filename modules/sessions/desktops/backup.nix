{pkgs, config, ...}:
{
  services.xserver.enable = true;
  services.xserver.windowManager.i3.enable = true;
  # services.desktopManager.plasma6.enable = true;
}
