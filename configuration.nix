{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./home
      ./boot.nix
      ./hardware.nix
      ./hardware-configuration.nix
      ./networking.nix
      ./packages.nix
      ./services.nix
    ];

  time.timeZone = "Europe/Moscow";

  system.stateVersion = "25.11";
}
