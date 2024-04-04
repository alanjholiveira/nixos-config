{ config, pkgs, ... }:

{
  imports = [
    ./aliases.nix
  ];

  config = {
    environment.systemPackages = with pkgs; [
      zsh-powerlevel10k
      # zsh-autosuggestions
      zsh
    ];
    
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      vteIntegration = false;
      histSize = 10000;
    };

    systemd.tmpfiles.rules = [
      # "L+ /usr/share/zsh/plugins/zsh-autosuggestions/ - - - - ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions"
      "L+ /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme - - - - ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme"
      "L+ /opt/asdf-vm - - - - ${pkgs.asdf-vm}/share/asdf-vm"
    ];

    environment.pathsToLink = [ 
      "/share/zsh"
    ];
    users.defaultUserShell = pkgs.zsh;
  };
}