{ config, pkgs, lib, modulesPath, ... }:

{
  config = {
    boot.kernelModules = [ "kvm-amd" ];
  };

}
