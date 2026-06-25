{pkgs, config, ...}:
{
  services.xserver.displayManager.lightdm = {
    enable = true;
    greeters.slick = {
      enable = true;
    };
    background = "/etc/lightdm/ferns.jpg";
    extraConfig = ''
        [Greeter]
        background=/etc/lightdm/ferns.jpg
        draw-user-backgrounds=false
    '';
  };
  environment.etc."lightdm/ferns.jpg".source = ./wallpapers/ferns.jpg;
}


