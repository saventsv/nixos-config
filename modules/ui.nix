{pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    quickshell
  ];
  
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka-term 
  ];
}

