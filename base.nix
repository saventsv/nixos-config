{...}:
{
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  imports = [
    ./modules/base-system.nix
    ./modules/display-manager.nix
    ./modules/browser.nix
    ./modules/keepassxc.nix
    ./modules/nvim.nix
    ./modules/emacs.nix
    ./modules/shell.nix
    ./modules/dev.nix
    ./modules/suckless.nix
    ./modules/ui.nix
    ./modules/xorg.nix
  ];
}
