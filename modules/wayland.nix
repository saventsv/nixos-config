{pkgs, config, ...}:
{
  programs.niri.enable = true;
  
  environment.systemPackages = with pkgs; [
    fuzzel
    swaybg
    rofi
    alacritty
    rofi-bluetooth
    rofi-network-manager
  ];
}

