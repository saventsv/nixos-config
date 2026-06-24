{pkgs, config, ...}:
{

  envoronment.systemPackages = with pkgs; [
    keepassxc
  ];

}

