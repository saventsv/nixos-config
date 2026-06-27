{pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    polybar
    ags
  ];
  
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka-term 
  ];
}

