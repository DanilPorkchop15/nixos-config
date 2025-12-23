{ pkgs, ... }:

{
  home.file = {
    ".config" = {
      source = ./dotfiles;
      recursive = true;
    };

    "Pictures/wallpapers" = {
      source = ./wallpapers;
      recursive = true;
    };
  };
}