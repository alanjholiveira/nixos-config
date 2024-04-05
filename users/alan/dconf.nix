{ lib, pkgs, ... }:
let
  inherit (lib.hm.gvariant) mkTuple;
in {
  if (services.xserver.desktopManager.gnome.enable or true) in {

  }
  dconf.settings = {

  };
  
}
