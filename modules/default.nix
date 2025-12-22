{ pkgs, ... }:

{
  imports =
    [
      ./boot.nix
      ./fonts.nix
      ./hardware.nix
      ./networking.nix
      ./packages.nix
      ./programs.nix
      ./services.nix
    ];
}