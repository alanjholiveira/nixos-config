{ config, pkgs, ... }:

{
    config = {
        boot.loader.efi.canTouchEfiVariables = true;

        boot.loader.grub = {
            enable = true;
            efiSupport = true;
            device = "nodev";
            useOSProber = true;
            #theme = pkgs.sleek-grub-theme;
        };
        #boot.plymouth = {
        #  enable = true;
        #};
    };
  
}
