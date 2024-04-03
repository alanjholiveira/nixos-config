{ config, pkgs, lib, modulesPath, ... }:

{
  config = {
    boot.kernelModules = [ "kvm-amd" ];
    hardware.cpu.and.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };

}
