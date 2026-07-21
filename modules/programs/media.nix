{ configs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mpv
    imv
    vlc
  ];
}
