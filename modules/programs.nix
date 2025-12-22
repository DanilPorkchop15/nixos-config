{ pkgs, ... }:

{
  # niri (scrollable tiling wayland compositor)
  programs.niri = {
    package = pkgs.niri;
    enable = true;
  };

  # noisetorch (mic filter)
  programs.noisetorch.enable = true;

  # zsh (shell)
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };
}