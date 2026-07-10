{pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    waybar
  ];
}

