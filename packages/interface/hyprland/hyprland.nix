{config, pkgs, ...}: 

{
  config = {
    services.xserver.displayManager.lightdm.enable = true;
    services.xserver.enable = true;
    # services.dunst.enable = true;
    programs.waybar.enable = true;

    programs.hyprland = {
      enable = true;
      xwayland = {
        enable = true; 
        # hidpi = true;
      };
    };
    # Optional, hint electron apps to use wayland:
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
    services.dbus.enable = true;
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
      ];
    };
    environment.systemPackages = with pkgs; [
      hyprland
      swww # for wallpapers
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      xwayland
      meson
      wayland-protocols
      wayland-utils
      wl-clipboard
      wlroots
      xwaylandvideobridge      
    ];
    nixpkgs.overlays = [
      (self: super: {
        waybar = super.waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        });
      })
    ];
    fonts.packages = with pkgs; [
      nerdfonts
      meslo-lgs-nf
      jetbrains-mono
      nerd-font-patcher
    ];

  };
}
