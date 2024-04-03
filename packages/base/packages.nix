{ config, pkgs, ... }:
{
  config = {
    environment.systemPackages = with pkgs; [
      zsh-powerlevel10k
      curl wget
      patchelf
      direnv
      nix-direnv
      git
      htop zsh
      ntfs3g
      smartmontools
      zip unzip xz
      # home-manager
      firefox
    ];

    environment.shellAliases = { };
   environment.variables = {
     EDITOR = "${pkgs.vscode}/bin/code";
   };
    environment.pathsToLink = [
      "/share/nix-direnv"
    ];

    programs.zsh.enable = true;

  };
  
}
