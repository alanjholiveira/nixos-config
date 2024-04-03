{ config, pkgs, lib, ... }:

{
  config = {
    services.xserver = {
      xkb = {
        layout = "br,us";
        model = "pc104";
        variant = "";
        options = "terminate:ctrl_alt_bksp"; #"grp:caps_toggle,grp_led:scroll"
      };
    };
  };
}