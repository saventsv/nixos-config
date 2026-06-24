{pkgs, config, ...}:
{

  services.xserver.enable = true;
  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.dwm.overrideAttrs (oldAttrs: {
      src = ./modules/dwm;
    });
  };

  envoronment.systemPackages = with pkgs; [

    alacritty # backup

    (pkgs.st.overrideAttrs (oldAttrs: {
      src = ../dotfiles/st; 
    }))

    (pkgs.dmenu.overrideAttrs (oldAttrs: {
      src = ../dotfiles/dmenu; 
    }))
    
  ];
}
