{ config, pkgs, ... }:

{
  config = {
    # Select internationalisation properties.
    services.xserver = {
      # xkb.model = "pc104";
      # xkb.variant = "";
      xkb.layout = "br,us";
      xkb.options = "grp:alt_shift_toggle"; #"terminate:ctrl_alt_bksp"; #"grp:caps_toggle,grp_led:scroll"
    };
    
    i18n.supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "pt_BR.UTF-8/UTF-8"
    ];
    
    i18n.defaultLocale = "en_US.UTF-8";
    # i18n.supportedLocales = [ "all" ];
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "pt_BR.UTF-8";
    };

    environment.systemPackages = with pkgs; [
      nuspell
      hyphen
      hunspell
      hunspellDicts.en_US
      hunspellDicts.pt_BR
    ];

  };
}