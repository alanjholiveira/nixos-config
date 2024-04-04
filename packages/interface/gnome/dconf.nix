{ lib, pkgs, ... }:
let
  inherit (lib.hm.gvariant) mkTuple;
in {
  if (services.xserver.desktopManager.gnome.enable = true) in {

  }
  dconf.settings = {

  };
  
}
