{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    nodejs
    wget
    ghostty
    git
    libnotify
    brightnessctl
    nix-prefetch-github
    xwayland-satellite
    where-is-my-sddm-theme
    kdePackages.qtmultimedia
    libdbusmenu
    playerctl
  ];
}