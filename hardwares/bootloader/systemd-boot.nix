{ config, pkgs, ... }:

{
  config = {
    # boot.kernelPackages = pkgs.linuxPackages_latest;
     # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.initrd.systemd.enable = true;
    boot.kernelParams = ["quiet"];
    boot.plymouth.enable = true;
    boot.plymouth.theme="spinner";
    # boot.loader.timeout = 30;
    # boot.loader.systemd-boot.editor = true;
    # boot.loader.systemd-boot.configurationLimit = 10;

    # boot.binfmt.emulatedSystems = (if pkgs.stdenv.isx86_64 then [
    #   "aarch64-linux"
    # ] else if pkgs.stdenv.isAarch64 then [
    #   "x86_64-linux"
    # ] else [ ]);
  };
}