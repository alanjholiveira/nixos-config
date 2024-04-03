{ config, pkgs, ... }:

{
  config = {
      services.flatpak.enable = true;
      #services.flatpak.packages = [ { appId = "com.kde.kdenlive"; origin = "flathub";  } ];
      #services.flatpak.update.onActivation = true;
      environment.systemPackages = [ pkgs.flatpak-builder ];
  };
}
