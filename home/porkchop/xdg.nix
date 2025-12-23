{ pkgs, ... }:

{
  xdg = {
    mimeApps.enable = true;
    mimeApps.defaultApplications = {
      "image/*" = [ "firefox.desktop" ];
    };

    portal = {
      enable = true;

      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
      ];

      config = {
        common.default = "gnome;gtk";
      };
    };
  };
}