{pkgs, config, ...}:
{
  programs.niri.enable = true;
  environment.systemPackages = with pkgs; [
    rofi
  ];
}

