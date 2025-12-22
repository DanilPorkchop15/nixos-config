
{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  boot.loader.efi.canTouchEfiVariables = false;

  networking.hostName = "paragon";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";

  boot.loader.grub = {
    enable = true;
    device = "nodev";
  };

  users.users.porkchop = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "docker" ];
    shell = pkgs.zsh;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  programs.noisetorch.enable = true;

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

  virtualisation.docker = {
    enable = true;                  
    autoPrune.enable = true;        
    autoPrune.flags = [ "--all" ];  
    storageDriver = "overlay2";        
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ intel-media-driver mesa ];
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  programs.niri = {
    package = pkgs.niri;
    enable = true;
  };

  services.displayManager.sessionPackages = with pkgs; [ niri ];
 
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.firefox.enable = true;

  security.polkit.enable = true;

  services.gnome.gnome-keyring.enable = true;

  services.v2raya.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    nodejs
    wget
    ghostty
    git
    libnotify
    brightnessctl
    nix-prefetch-github
    xwayland-satellite
    where-is-my-sddm-theme
    kdePackages.qtmultimedia
    libdbusmenu
    playerctl
  ];

  home-manager.users.porkchop = { pkgs, ... }: {
    home.stateVersion = "25.11";

    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
      waybar
      mako
      fuzzel 
      catppuccin-gtk 
      bibata-cursors
      telegram-desktop
      yazi 
      yandex-music
      nautilus
      asciiquarium-transparent
      btop
      lazydocker
      lazygit
      pavucontrol
      fzf
      fastfetch
      ghostty
      zsh-powerlevel10k
      lazydocker 
      unimatrix
      openconnect
      pipes-rs
      jetbrains.webstorm
      swayidle
      wlsunset
      swaylock-effects
      wl-clipboard
      vesktop
      swww
      loupe
      gnome.gvfs
      bluetuith
    ];
    
    xdg = {
      mimeApps.enable = true;
      mimeApps.defaultApplications = {
        "image/*" = [ "firefox`.desktop" ];
      };
      portal = {
        enable = true;
        extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
        config.common.default = "gtk";
      };
    };

    gtk = {
      enable = true;
  
      theme = {
        name = "Catppuccin-Mocha-Standard-Blue-Dark";
        package = pkgs.catppuccin-gtk.override {
          accents = [ "blue" ];
          variant = "mocha";
          size = "standard";
        };
      };

      cursorTheme = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 20;
      };

      gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
      gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    };

    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    dconf.settings = { 
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "Catppuccin-Mocha-Standard-Blue-Dark";
      };
    };

    home.file.".config/fuzzel/fuzzel.ini".text = ''
       [main]
       font=JetBrainsMono Nerd Font:size=12
  
       [colors]
       background=1e1e2eff
       text=cdd6f4ff
       prompt=bac2deff
       placeholder=7f849cff
       input=cdd6f4ff
       match=f9e2afff
       selection=585b70ff
       selection-text=cdd6f4ff
       selection-match=f9e2afff
       counter=7f849cff
       border=89b4faff    
 
       [border]
       width=4
       radius=0
 
       [input]
       icon-theme=papirus-icon-theme
    '';


   home.file.".config/swaylock/config".text = ''
       # Catppuccin Mocha
       color=1e1e2e
  
       # Кольцо индикатора
       ring-color=313244
       ring-clear-color=45475a
       ring-ver-color=89b4fa
       ring-wrong-color=f38ba8
  
       # Текст
       text-color=cdd6f4
       text-clear-color=89b4fa
       text-ver-color=a6e3a1
       text-wrong-color=f38ba8
  
       # Клавиатура
       key-hl-color=89b4fa
  
       # Эффекты
       effect-blur=7x5
       effect-vignette=0.5:0.5
       fade-in=1

       clock=yes
       indicator=yes
       indicator-radius=200
       indicator-thickness=8
       timestr=%H:%M
       datestr=%Y-%m-%d
     '';


    home.file.".config/ghostty/config".text = ''
      font-family = JetBrainsMono Nerd Font
      font-size = 12
      theme = Catppuccin Mocha
      window-decoration = false
      
      window-padding-x = 12
      window-padding-y = 12
      window-padding-balance = true
  
      window-decoration = false
    '';

    services.swayidle = {
      enable = true;
      package = pkgs.swayidle;
      timeouts = [
        { timeout = 300; command = "${pkgs.swaylock-effects}/bin/swaylock-effects -f --config ~/.config.swaylock/config --indicator --clock --indicator-redius=200"; }
        { timeout = 600; command = "systemctl suspend"; }
      ];
      events = [
        {
          event = "before-sleep"; 
          command = "${pkgs.swaylock-effects}/bin/swaylock-effects -f";
        }
      ];
    };

    programs.zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "sudo" "docker" ];
      };
      history = {
        expireDuplicatesFirst = true;  
        ignoreDups = true;            
        ignoreSpace = true;           
        share = true;                
      };
      initContent = ''
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      '';
    };

    home.sessionVariables = {
      GTK_THEME = "Catppuccin-Mocha-Standard-Blue-Dark";
    };

    home.file.".config/waybar/config.jsonc".source = ./.config/waybar/config.jsonc;
    home.file.".config/waybar/style.css".source = ./.config/waybar/style.css;
    home.file.".config/mako/config".text = ''
      font=JetBrainsMono Nerd Font 12
      background-color=#1e1e2eEE
      text-color=#cdd6f4
      border-color=#89b4fa
      border-size=4
      padding=12
      margin=12
      width=400
      height=120
      progress-color=source #a6e3a1
      icons=1
      max-icon-size=48
      icon-location=left
      group-by=app-name,summary
      format=<b>󰂞 %a</b>\n<b>%s</b>\n%b
      default-timeout=10000
      ignore-timeout=1
      layer=overlay
      anchor=top-right
      on-button-left=invoke-default-action
      on-button-middle=dismiss-group
      on-button-right=dismiss-all

      [urgency=low]
      border-color=#45475a
      default-timeout=5000

      [urgency=normal]
      border-color=#89b4fa

      [urgency=critical]
      border-color=#f38ba8
      background-color=#f38ba822
      text-color=#f38ba8
      default-timeout=0

      [app-name=Firefox]
      border-color=#f5a97f
    '';

  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    font-awesome
  ];

  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts = {
    monospace = [ "JetBrainsMono Nerd Font" ];
    sansSerif = [ ];
    serif = [ ];
  };



  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11";

}

