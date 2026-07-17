{pkgs, config, ...}:
{
  services.xserver.enable = true;
  services.xserver.xkb.options = "ctrl:nocaps";
  services.flameshot.enable = true;

  environment.systemPackages = with pkgs; [
    polybar
    xclip
    picom
    feh

    (pkgs.st.overrideAttrs (oldAttrs: {
      src = ../../dotfiles/st; 
    }))

    (pkgs.dmenu.overrideAttrs (oldAttrs: {
      src = ../../dotfiles/dmenu; 
    }))
  ];
}
