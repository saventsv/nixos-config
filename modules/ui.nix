{pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    polybar
    waybar
    ags
    quickshell
  ];
  
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka-term 
  ];
}

