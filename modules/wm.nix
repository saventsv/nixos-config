{pkgs, config, ...}:
{
  programs.niri.enable = true;
  
  evironment.systemPackages = with pkgs; [
    fuzzel
  ];
}

