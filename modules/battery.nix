{pkgs, config, ...}:
{
  services.power-profiles-daemon.enable = false;
  services.upower.enable = true;
  services.logind = {
    enable = true;

    settings.Login = {
  HandleLidSwitch = "suspend";
  HandleLidSwitchExternalPower = "suspend";
  HandleLidSwitchDocked = "ignore";
    };
  };
}
