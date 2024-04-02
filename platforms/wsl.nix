{ pkgs, lib, ... }:

{
  config = {
    boot.wsl.enable = true;
    boot.wsl.user = "alan";
    i18n.supportedLocales = [ "all" ];
    i18n.defaultLocale = "en_US.UTF-8";
  };
}