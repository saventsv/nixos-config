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
    ./modules/display-manager.nix
    ./modules/browser.nix
    ./modules/keepassxc.nix
    ./modules/nvim.nix
    ./modules/shell.nix
    ./modules/dev.nix
    ./modules/ui.nix
    # ./modules/niri.nix
    ./modules/xorg.nix
    ./modules/xmonad.nix
  ];
}
