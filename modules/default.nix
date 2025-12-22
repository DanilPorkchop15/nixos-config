{ pkgs, ... }:

{
  imports =
    [
      ./boot.nix
      ./hardware.nix
      ./hardware-configuration.nix
      ./networking.nix
      ./packages.nix
      ./services.nix
    ];
}