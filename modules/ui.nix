{pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    quickshell
    eww

    # depandancies for the bar
    socat
    jq
  ];
  
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka-term 
  ];
}

