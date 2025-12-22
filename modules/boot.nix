{ pkgs, ... }:

{
  # boot options (current - nodev grub)
  boot.loader.efi.canTouchEfiVariables = false;
  boot.loader.grub = {
    enable = true;
    device = "nodev";
  };
}