{...}:
{
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
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
