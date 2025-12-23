{ pkgs, ... }:

{
  users.users.porkchop = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "docker" ];
    shell = pkgs.zsh;
  };

  home-manager.users.porkchop = { pkgs, inputs, ... }: {
    imports = [
      ./dotfiles.nix
      ./packages.nix
      ./programs.nix
      ./scripts.nix
      ./services.nix
      ./theme.nix
      ./xdg.nix
    ];

    home.stateVersion = "25.11";
  };
}
