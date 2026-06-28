{pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    zoom-us
  ];
  programs.discord.enable = true;
}
