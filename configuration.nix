{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./home
      ./modules
      ./hardware-configuration.nix
    ];

  time.timeZone = "Europe/Moscow";

  system.stateVersion = "25.11";
}
