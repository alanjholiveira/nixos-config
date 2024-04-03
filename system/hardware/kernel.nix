{ config, pkgs, ... }:

{
  config = {
    boot.kernelPackages = pkgs.linuxPackages_latest; #pkgs.linuxPackages_zen;
    boot.consoleLogLevel = 0;
  };
}
