{pkgs, config, ...}:
{
  networking.networkmanager.enable = true;
  services.dbus.enable = true;
  programs.nm-applet.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.syncthing = {
    enable = true;
    user = "saven";
    dataDir = "/home/saven";
    configDir = "/home/saven/.config/syncthing";
  };

  nixpkgs.config.allowUnfree = true;
  
  services.dunst.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gammastep

    libnotify

    bluetui
    bluez
    bluez-tools
  ];

}

