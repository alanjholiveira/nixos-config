{ config, pkgs, lib, ... }:

{
  home.username = "alan";
  home.homeDirectory = "/home/alan";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Alan Oliveira";
    userEmail = "alanjhone@gmail.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  home.activation = {
    scriptActivationAction = lib.hm.dag.entryAfter ["writeBoundary"] ''
    CONFIG_PATH=${../../config}
    ${builtins.readFile ./activation.sh}
   '';
  };

  # home.packages = with pkgs; [
  #   fix-vscode
  # ];

  # home.file = {
  #   ".p10k.zsh" = {
  #     text = (builtins.readFile ../../config/powerlevel10k/.p10k.zsh) + ''
  #       set -g default-shell ${pkgs.zsh}/bin/zsh
  #     '';
  #   };
  # };

  # home.file = {
  #   ".p10k.zsh" = {
  #     enable = true;
  #     # source =  "../../config/powerlevel10k/.p10k.zsh";
  #     source =  config.lib.file.mkOutOfStoreSymlink ../../config/powerlevel10k/.p10k.zsh;
  #     recursive = true;
  #     # outOfStoreSymlink = true;
  #     # executable = true;
  #   };
  #    ".zshrc" = {
  #     source =  config.lib.file.mkOutOfStoreSymlink ../../config/zshrc/.zshrc;
  #     # source =  "../../config/zshrc/.zshrc";
  #     recursive = true;
  #     # outOfStoreSymlink = true;
  #     # executable = true;
  #   };
  # };
  home.stateVersion = "23.11";

}