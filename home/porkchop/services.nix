{ pkgs, ...}:

{
  # v2raya (vpn)
  services.v2raya.enable = true;

  # swayidle (commands on idle)
  services.swayidle = {
    enable = true;
    package = pkgs.swayidle;
    timeouts = [
      { timeout = 300; command = "${pkgs.swaylock-effects}/bin/swaylock-effects -f --config ~/.config/swaylock/config --indicator --clock --indicator-redius=200"; }
      { timeout = 600; command = "systemctl suspend"; }
    ];
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock-effects}/bin/swaylock-effects -f";
      }
    ];
  };
}