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


  home.stateVersion = "23.11";

}