{pkgs, config, ...}:
{
  services.xserver.enable = true;
  services.xserver.xkb.options = "ctrl:nocaps";

  environment.systemPackages = with pkgs; [
    polybar
    xclip
    picom
    gammastep
    xfce4-screenshooter
    feh

    (pkgs.st.overrideAttrs (oldAttrs: {
      src = ../../dotfiles/st; 
    }))

    (pkgs.dmenu.overrideAttrs (oldAttrs: {
      src = ../../dotfiles/dmenu; 
    }))
  ];
}
