{ config, pkgs, ... }:

{
  config = {
    boot.kernelPackages = pkgs.linuxPackages_latest; #pkgs.linuxPackages_zen;
    boot.consoleLogLevel = 0;
    boot.kernelParams = [ 
      "quiet"
      "fbcon=nodefer"
      "vt.global_cursor_default=0"
      "kernel.modules_disabled=1"
      "lsm=landlock,lockdown,yama,integrity,apparmor,bpf,tomoyo,selinux"
      "usbcore.autosuspend=-1"
      "video4linux"
      "acpi_rev_override=5"
      "security=selinux"
    ];
  };
}
