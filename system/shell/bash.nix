{ config, pkgs, ... }:

{
  imports = [
    ./aliases.nix
  ];

  config = {
    environment.systemPackages = with pkgs; [
      bash
    ];
    
    programs.bash = {
      enable = true;
      enableVteIntegration = false;
      historyFileSize = 10000;
      historySize = 10000;
      initExtra = ''
        # End of line configured by asdf-vm
        source ${pkgs.asdf-vm}/share/asdf-vm/asdf.sh
      '';
    };
  };
}