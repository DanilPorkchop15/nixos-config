{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules
      ./home
    ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Moscow";

  system.stateVersion = "25.11";
}
