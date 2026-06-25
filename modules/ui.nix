{pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    eww
  ];
  
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka-term 
  ];
}

