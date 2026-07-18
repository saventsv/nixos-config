{ configs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fish
  ];
}
