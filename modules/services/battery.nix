{pkgs, config, ...}:
{
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
