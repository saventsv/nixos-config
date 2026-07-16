{pkgs, config, ...}:
{
  services.xserver.enable = true;
  services.xserver.xkb.options = "ctrl:nocaps";

  environment.systemPackages = with pkgs; [
    polybar
    xclip
    picom
    flameshot
    feh
    alacritty # as a backup 

    (pkgs.st.overrideAttrs (oldAttrs: {
      src = ../../dotfiles/st; 
    }))

    (pkgs.dmenu.overrideAttrs (oldAttrs: {
      src = ../../dotfiles/dmenu; 
    }))
  ];
}
