{ pkgs, ... }:

{
  # firefox (browser)
  programs.firefox.enable = true;

  # zoxide (smarter directory navigation)
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # noisetorch (mic filter)
  programs.noisetorch.enable = true;

  # zsh (shell)
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
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
}