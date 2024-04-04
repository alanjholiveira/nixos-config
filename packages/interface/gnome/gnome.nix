/*
  A trait for headed boxxen
*/
{ config, pkgs, lib, ... }:

{
  imports = [
    # ./dconf.nix
  ];
  config = {
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.displayManager.autoLogin.enable = false;
    services.xserver.desktopManager.gnome.enable = true;
    environment.gnome.excludePackages = (with pkgs; [
      gnome-photos
      gnome-tour
    ]) ++ (with pkgs.gnome; [
      cheese # webcam tool
      gnome-music
      epiphany # web browser
      geary # email reader
      gnome-characters
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
      yelp # Help view
      gnome-contacts
      gnome-initial-setup
      gnome-weather
      gnome-clocks
    ]);

    environment.systemPackages = with pkgs; [
      gnome.gnome-tweaks
      gnome.gnome-characters
      gnome.dconf-editor
    ];

    services.gnome.gnome-keyring.enable = true;
    programs.dconf.enable = true;
    services.dbus.packages = with pkgs; [ dconf ];
  };
}

