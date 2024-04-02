{ config, pkgs, lib, modulesPath, ... }:

let
  encryptedDeviceLabel = "encrypt";
  encryptedDevice = "/dev/nvme1n1p2";
  efiDevice = "/dev/nvme1n1p1";
  makeMounts = import ./../functions/make_mounts.nix;
in
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  config = {
    boot.kernelParams = ["quiet"];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    services.xserver.videoDrivers = [ "nvidia" ];

    fileSystems = makeMounts {
      inherit encryptedDevice encryptedDeviceLabel efiDevice;
    };

    # This doesn't seem to work...
    /* environment.etc."crypttab" = {
      enable = true;
      text = ''
      encrypt /dev/nvme1n1p2 - fido2-device=auto
      '';
    }; */

    networking.hostName = "Aliewnare-M15";
    networking.domain = "hoverbear.home";
  };
}