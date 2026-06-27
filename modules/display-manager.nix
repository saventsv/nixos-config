{pkgs, config, ...}:
{
  # services.xserver.displayManager.lightdm = {
  #   enable = true;
  #   # greeters.slick = {
  #   #   enable = true;
  #   # };
  #   background = "/etc/lightdm/ferns.jpg";
  # };
  # environment.etc."lightdm/ferns.jpg".source = ./wallpapers/ferns.jpg;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}


