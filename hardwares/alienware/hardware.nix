{ config, pkgs, lib, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ../bootloader/systemd-boot.nix
    ./nvidia.nix
  ];

  config = {
    boot.initrd.availableKernelModules = [ 
      "xhci_pci" 
      "thunderbolt" 
      "vmd" 
      "nvme" 
      "usb_storage" 
      "usbhid" 
      "sd_mod" 
    ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];
    # boot.kernelParams = ["quiet"];
    # services.xserver.videoDrivers = [ "nvidia" ];
    

    fileSystems."/" =
      { device = "/dev/disk/by-uuid/68197200-83d3-4ef0-8f7c-f6d3dd9a9fc2";
        fsType = "ext4";
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/0A22-8DA6";
        fsType = "vfat";
      };

    swapDevices =
      [ { device = "/dev/disk/by-uuid/0cc89c64-8b54-42b5-b653-4da701584769"; }
      ];

    networking.hostName = "Aliewnare-M15";
    # networking.domain = "hoverbear.home";
    # networking.hostId = "57ee003f";
  
  };
}
