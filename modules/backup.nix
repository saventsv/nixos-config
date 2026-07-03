{pkgs, config, ...}:
{
  services.xserver.windowManager.i3.enable = true;
  services.desktopManager.plasma6.enable = true;

  
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    khelpcenter
      konsole
      plasma-browser-integration
      kdeconnect-kde
  ];
}
