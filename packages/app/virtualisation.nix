{ config, global, pkgs, lib, ... }:

{
  config = lib.mkIf config.virtualisation.libvirtd.enable {
    users.users.${global.username} = {
      # extraGroups = [ "kvm" "libvirtd" ];
    };
    systemd.services.libvirtd.path = with pkgs; [ virtiofsd ];
    environment.systemPackages = with pkgs; [
      virt-manager
      qemu
      libvirt
    ];
   };



#   # Various packages related to virtualization, compatability and sandboxing
#   home.packages = with pkgs; [
#     # Virtual Machines and wine
#     libvirt
#     virt-manager
#     qemu
#     uefi-run
#     lxc
#     swtpm
#     bottles

#     # Filesystems
#     dosfstools
#   ];

#   home.file.".config/libvirt/qemu.conf".text = ''
# nvram = ["/run/libvirt/nix-ovmf/OVMF_CODE.fd:/run/libvirt/nix-ovmf/OVMF_VARS.fd"]
#   '';

}
