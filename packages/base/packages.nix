{ config, pkgs, ... }:
{
  config = {
    environment.systemPackages = with pkgs; [
      curl wget
      patchelf
      direnv
      nix-direnv
      git
      htop
      ntfs3g
      smartmontools
      zip unzip xz
      home-manager
      firefox
      asdf-vm
      google-chrome
      microsoft-edge
    ];
   
    environment.pathsToLink = [
      "/share/nix-direnv"
    ];

  };
  
}
