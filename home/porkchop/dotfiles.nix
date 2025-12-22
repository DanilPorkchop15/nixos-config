{ pkgs, ... }:

{
  # waybar (topbar provider)
  home.file.".config/waybar/config.jsonc".source = ./.config/waybar/config.jsonc;
  home.file.".config/waybar/style.css".source = ./.config/waybar/style.css;

  # mako (notifications)
  home.file.".config/mako/config.ini".source = ./.config/mako/config.ini;

  # fuzzel (menu provider)
  home.file.".config/fuzzel/fuzzel.ini".source = ./.config/fuzzel/config.ini;

  # swaylock (lockscreen)
  home.file.".config/swaylock/config".source = ./.config/swaylock/config.ini;

  # ghostty (terminal)
  home.file.".config/ghostty/config.ini".source = ./.config/ghostty/config.ini;
}