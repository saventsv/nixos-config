{pkgs, config, ...}:
{

  envoronment.systemPackages = with pkgs; [
    firefox
  ];
}

