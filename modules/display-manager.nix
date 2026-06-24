{pkgs, config, ...}:
{
  services.xserver.displayManager.lightdm = {
    enable = true;
    greeters.slick = {
      enable = true;
      # TODO add custom background
    };
}


