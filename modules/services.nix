{ pkgs, ... }:

{
  services.libinput.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    theme = "where_is_my_sddm_theme";
    extraPackages = with pkgs; [
      where-is-my-sddm-theme
      kdePackages.qt5compat
      kdePackages.qtmultimedia
      kdePackages.qtsvg
      kdePackages.qtdeclarative
    ];
  };

  services.displayManager.sessionPackages = with pkgs; [ niri ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.niri = {
    package = pkgs.niri;
    enable = true;
  };

  services.gnome.gnome-keyring.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
    autoPrune.flags = [ "--all" ];
    storageDriver = "overlay2";
  };
}