{ lib, pkgs, ... }:

{
  config = {
    home-manager.users.alan = ./home.nix;
    users.users.alan = {
      # initialPassword = "changeme";
      isNormalUser = true;
      description = "Alan Oliveira";
      home = "/home/alan";
      createHome = true;
      shell = pkgs.zsh;
      extraGroups = [ "networkmanager" "wheel" "docker"];
      packages = with pkgs; [];
    };
  };
}
