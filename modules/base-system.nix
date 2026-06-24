{pkgs, config, ...}:
{
  networking.networkmanager.enable = true;
  services.syncthing = {
    enable = true;
    user = "saven";
    dataDir = "/home/saven";
    configDir = "/home/saven/.config/syncthing";
  };

  hardware.bluetooth.enable = true;
  nixpkgs.config.allowUnfree = true;
  
  services.xserver.enable = true;
  services.xserver.xkb.options = "ctrl:nocaps";

  services.dunst.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

}
