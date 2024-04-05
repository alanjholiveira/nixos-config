{config, pkgs, ...}: 

{
  config = {
    environment.systemPackages = with pkgs; [
      # notification daemon
      dunst
      libnotify
      # terminal emulator
      kitty
      foot
      # networking
      networkmanagerapplet # GUI for networkmanager
      # editors
      nano
      # app launchers
      rofi-wayland
      wofi
    ];
    

  };
}