{ config, clib, ... }:

{
  config = {
    services.openssh = {
      enable = false;
      openFirewall = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
      hostKeys = [
        {
          path = "/persist/ssh/ssh_host_ed25519_key";
          type = "ed25519";
        }
        {
          path = "/persist/ssh/ssh_host_rsa_key";
          type = "rsa";
          bits = 4096;
        }
      ];
    };
    networking.firewall.allowedTCPPorts = [ 22 ];
    networking.firewall.allowedUDPPorts = [ 22 ];
  };
}