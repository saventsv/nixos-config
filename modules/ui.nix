{pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    quickshell
    eww
  ];
  
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka-term 
  ];
}

