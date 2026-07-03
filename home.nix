{ config, pkgs, ... }:
{
  home.stateVersion = "25.05";

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink
    ./dotfiles/nvim;

  xdg.configFile."polybar".source =
    config.lib.file.mkOutOfStoreSymlink
    ./dotfiles/polybar;

  xdg.configFile."alacritty".source =
    config.lib.file.mkOutOfStoreSymlink
    ./dotfiles/alacritty;

  xdg.configFile."dunst".source =
    config.lib.file.mkOutOfStoreSymlink
    ./dotfiles/dunst;

  xdg.configFile."xmonad".source =
    config.lib.file.mkOutOfStoreSymlink
    ./dotfiles/xmonad;

  xdg.configFile."rofi".source =
    config.lib.file.mkOutOfStoreSymlink
    ./dotfiles/rofi;

  xdg.configFile."waybar".source =
    config.lib.file.mkOutOfStoreSymlink
    ./dotfiles/waybar;

  xdg.configFile."niri".source =
    config.lib.file.mkOutOfStoreSymlink
    ./dotfiles/niri;

  xdg.configFile."picom".source =
    config.lib.file.mkOutOfStoreSymlink
    ./dotfiles/picom;

  xdg.configFile."tmux".source =
    config.lib.file.mkOutOfStoreSymlink
    ./dotfiles/tmux;
}
