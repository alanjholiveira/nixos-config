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
    { device = "/dev/disk/by-uuid/2e7a33b4-fed3-4a18-ada6-96468d61f8f9";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/7FB2-BD49";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/c513e292-da45-42c8-a22c-cfda10692405"; }
    ];

    networking.hostName = "Aliewnare-M15";
    # networking.domain = "hoverbear.home";
    # networking.hostId = "57ee003f";
  
  };
}
