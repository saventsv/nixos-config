{...}:
{
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };
  nix.firewall.enable = false;

  boot.loader.systemd-boot.configurationLimit = 10;

  nix.settings.auto-optimise-store = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  imports = [
    ./modules/base-system.nix
    ./modules/sessions
    ./modules/programs
    ./modules/services
    ./modules/development
  ];
}
