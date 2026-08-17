{ configs, pkgs, ... }:
{
  imports = [
    ./dev.nix
    ./nvim.nix
    ./shell.nix
    ./rustlings.nix
  ];
}
