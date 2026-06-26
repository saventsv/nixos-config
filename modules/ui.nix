{pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    quickshell
    eww
    polybar

    # depandancies for the bar
    socat
    jq
  ];
  
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka-term 
  ];
}

