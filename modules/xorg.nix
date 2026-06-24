{pkgs, config, ...}:
{

  envoronment.systemPackages = with pkgs; [
    xclip
    picom
    flameshot
  ];

}
