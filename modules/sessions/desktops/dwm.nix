{ pkgs, config, ... }:
{
  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.dwm.overrideAttrs (oldAttrs: {
      src = ../../../dotfiles/dwm;
      buildInputs = (oldAttrs.buildInputs or []) ++ [
      pkgs.yajl
      ];
    });
  };
}
