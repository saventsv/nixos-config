{pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    upower
  ];
}
