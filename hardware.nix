{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ intel-media-driver mesa ];
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}