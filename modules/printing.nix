{ config, pkgs, ... }:
{
  services.printing = {
    enable = true;
    browsing = true;
    listenAddresses = [ "*:631" ];
    allowFrom = [ "all" ];
    defaultShared = true;
    drivers = with pkgs; [
      gutenprint 
      hplip 
      brlaser
      epson-escpr
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };
}
