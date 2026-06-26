{pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    alacritty
    rofi
  ];
  services.xserver.windowManager.i3.enable = true;
  services.desktopManager.plasma6.enable = true;
}
