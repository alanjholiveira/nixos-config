{ lib, ... }:

{
  config = {
    #  virtualisation.libvirtd.enable = true;
    #  virtualisation.libvirtd.onBoot = "ignore";
    #  virtualisation.libvirtd.qemu.package = pkgs.qemu_full;
    #  virtualisation.libvirtd.qemu.ovmf.enable = true;
    #  virtualisation.libvirtd.qemu.ovmf.packages = if pkgs.stdenv.isx86_64 then [ pkgs.OVMFFull.fd ] else [ pkgs.OVMF.fd ];
    # virtualisation.libvirtd.qemu.swtpm.enable = true;
    #  virtualisation.libvirtd.qemu.swtpm.package = pkgs.swtpm;
    #  virtualisation.libvirtd.qemu.runAsRoot = false;
    #  virtualisation.spiceUSBRedirection.enable = true; # Note that this allows users arbitrary access to USB devices. 
     # virtualisation.podman.enable = true;
     virtualisation.spiceUSBRedirection.enable = true; # Note that this allows users arbitrary access to USB devices. 
     # virtualisation.podman.enable = true;
    virtualisation.libvirtd = {
      enable = true;
      onBoot "ignore";
      qemu.package = pkgs.qemu_full;
      qemu.ovmf.enable = true;
      qemu.ovmf.packages = if pkgs.stdenv.isx86_64 then [ pkgs.OVMFFull.fd ] else [ pkgs.OVMF.fd ];
      qemu.swtpm.enable = true;
      qemu.swtpm.package = pkgs.swtpm;
      qemu.runAsRoot = false;
    };
  };
}