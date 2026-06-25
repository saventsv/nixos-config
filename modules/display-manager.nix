{pkgs, config, ...}:
{
  services.xserver.displayManager.lightdm = {
    enable = true;
    background = "/etc/lightdm/ferns.jpg";
    greeters.slick = {
      enable = true;

      extraConfig = ''
        [Greeter]
        draw-user-backgrounds=false
        /etc/lightdm/ferns.jpg
      '';
    };
  };
}


