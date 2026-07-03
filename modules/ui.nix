{pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    polybar
    waybar
  ];
  
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka-term 
  ];
}

