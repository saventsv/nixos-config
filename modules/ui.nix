{pkgs, config, ...}:
{

  envoronment.systemPackages = with pkgs; [
    quickshell
  ];
}

