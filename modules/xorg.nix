{pkgs, config, ...}:
{
  services.xserver.enable = true;
  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.dwm.overrideAttrs (oldAttrs: {
      src = ../dotfiles/dwm;
      
      buildInputs = (oldAttrs.buildInputs or []) ++ [
      pkgs.yajl
      ];
    });
  };

  environment.systemPackages = with pkgs; [
    xclip
    picom
    flameshot
    alacritty # backup
    feh

    (pkgs.st.overrideAttrs (oldAttrs: {
      src = ../dotfiles/st; 
    }))

    (pkgs.dmenu.overrideAttrs (oldAttrs: {
      src = ../dotfiles/dmenu; 
    }))
    
  ];
}
