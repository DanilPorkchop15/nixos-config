{ pkgs, ... }:

{
  home.file = {
    ".config/ghostty/config".source = ./dotfiles/ghostty/config.ini;
    ".config/mako/config".source = ./dotfiles/mako/config.ini;
    ".config/swaylock/config".source = ./dotfiles/swaylock/config.ini;
    ".config/waybar/config.jsonc".source = ./dotfiles/waybar/config.jsonc;
    ".config/waybar/style.css".source = ./dotfiles/waybar/style.css;
    ".config/fuzzel/fuzzel.ini".source = ./dotfiles/fuzzel/fuzzel.ini;
  };
}