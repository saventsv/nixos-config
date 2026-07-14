{ configs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bibata-cursors
  ];
  environment.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  };
}
