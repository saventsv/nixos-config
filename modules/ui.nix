{pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    polybar
    waybar
    ags
  ];
  
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka-term 
  ];
}

