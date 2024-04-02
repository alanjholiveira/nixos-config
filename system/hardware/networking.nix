{
  networking = {
    # hostName = "nix";
    extraHosts = ''
        127.0.0.1 local.local
    '';

    networkmanager.enable = true;
  };  

  programs.openvpn3.enable = true;
  
}
