{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "niri-nmtui" ''
      #!/bin/sh
      NEWT_COLORS='
        root=white,#1e1e2e
        window=white,#1e1e2e
        border=blue,#1e1e2e
        actborder=blue,#1e1e2e
        shadow=#1e1e2e,#1e1e2e
        title=red,#1e1e2e
        button=#1e1e2e,blue
        actbutton=#1e1e2e,white
        checkbox=white,#1e1e2e
        actcheckbox=#1e1e2e,white
        entry=white,#1e1e2e
        disentry=white,#1e1e2e
        label=yellow,#1e1e2e
        listbox=white,#1e1e2e
        sellistbox=#1e1e2e,white
        actsellistbox=#1e1e2e,white
        actlistbox=#1e1e2e,#1e1e2e
        textbox=white,#1e1e2e
      ' ${pkgs.ghostty}/bin/ghostty -e nmtui &
    '')

    (writeShellScriptBin "niri-powermenu" ''
      #!/bin/sh
      choice=$(echo -e "󰐥 Shutdown\n󰑓 Reboot\n󰒲 Suspend\n Lock" | ${pkgs.fuzzel}/bin/fuzzel --dmenu --lines 4 --border-radius=0)
      case $choice in
        *"󰐥 Shutdown") systemctl poweroff ;;
        *"󰑓 Reboot") systemctl reboot ;;
        *"󰒲 Suspend") systemctl suspend ;;
        *" Lock") ${pkgs.swaylock-effects}/bin/swaylock-effects --indicator --clock --indicator-radius=200 ;;
      esac
    '')

    (writeShellScriptBin "niri-wall-next" ''
      #!/bin/sh
      DIR="$HOME/Pictures/wallpapers"
      STATE_FILE="$HOME/.cache/wall-index"

      mkdir -p "$DIR"
      [ ! -f "$STATE_FILE" ] && echo "0" > "$STATE_FILE"

      INDEX=$(cat "$STATE_FILE")
      FILES=($(
        ls -1 "$DIR"/*.jpg "$DIR"/*.png "$DIR"/*.jpeg "$DIR"/*.gif 2>/dev/null | head -n 100
      ))
      COUNT=''${#FILES[@]}

      [ $COUNT -eq 0 ] && { echo "No wallpapers in $DIR" >&2; exit 1; }

      NEXT_INDEX=$(( (INDEX + 1) % COUNT ))
      echo "$NEXT_INDEX" > "$STATE_FILE"

      ${pkgs.swww}/bin/swww img "''${FILES[$NEXT_INDEX]}" --transition-type fade --transition-duration 1
    '')

    (writeShellScriptBin "niri-wlsunset-toggle" ''
      #!/bin/sh
      if pgrep -x wlsunset > /dev/null; then
        pkill wlsunset
      else
        ${pkgs.wlsunset}/bin/wlsunset -l 55.8 -L 37.6 -T 6500 -t 4000 &
      fi
    '')
  ];
}