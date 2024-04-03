{ pkgs, lib, ... }:

{
  config = {
    # boot.wsl.enable = true;
    # boot.wsl.user = "alan";
    wsl.enable = true;
    wsl.defaultUser = "alan";
    i18n.supportedLocales = [ "all" ];
    i18n.defaultLocale = "en_US.UTF-8";
    system.stateVersion = "23.11";
  };
}