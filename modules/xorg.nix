{pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    xclip
    picom
    flameshot
  ];
}
