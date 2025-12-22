{ pkgs, ... }:

{
  home.packages = with pkgs; [
    waybar
    mako
    fuzzel
    catppuccin-gtk
    bibata-cursors
    telegram-desktop
    yazi
    yandex-music
    nautilus
    asciiquarium-transparent
    btop
    lazydocker
    lazygit
    pavucontrol
    fzf
    fastfetch
    ghostty
    zsh-powerlevel10k
    lazydocker
    unimatrix
    openconnect
    pipes-rs
    jetbrains.webstorm
    swayidle
    wlsunset
    swaylock-effects
    wl-clipboard
    vesktop
    swww
    loupe
    gnome.gvfs
    bluetuith
  ];
}