{...}:
{
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  boot.loader.systemd-boot.configurationLimit = 10;

  nix.settings.auto-optimise-store = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  imports = [
    ./modules/base-system.nix
    ./modules/sessions/display-manager.nix
    ./modules/programs/browser.nix
    ./modules/programs/keepassxc.nix
    ./modules/development/nvim.nix
    ./modules/development/shell.nix
    ./modules/development/dev.nix
    ./modules/sessions/fonts.nix
    ./modules/sessions/status_bar.nix
    ./modules/sessions/xorg.nix
    ./modules/sessions/dwm.nix
  ];
}
