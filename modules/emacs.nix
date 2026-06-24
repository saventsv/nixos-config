{pkgs, config, ...}:
{

  envoronment.systemPackages = with pkgs; [
    emacs
  ];
}

