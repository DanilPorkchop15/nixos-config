{ pkgs, ... }:

{
  users.users.porkchop = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "docker" ];
    shell = pkgs.zsh;
  };

  home-manager.users.porkchop = { pkgs, ... }: {
    imports = [
      ./dotfiles.nix
      ./fonts.nix
      ./packages.nix
      ./programs.nix
      ./services.nix
      ./theme.nix
      ./xdg.nix
    ];

    nixpkgs.config.allowUnfree = true;

    home.stateVersion = "25.11";
  };
}
