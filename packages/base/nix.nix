{ config, pkgs, ... }:
{
    config = {
      nixpkgs.config.allowUnfree = true;
      nix = {
       package = pkgs.nixUnstable;
       settings = {
         experimental-features = [ "flakes" "nix-command" ];      
       #   substituters = [
       #     "https://nix-community.cachix.org"
       #     "https://cache.nixos.org/"
       #     "https://cache.iog.io"
       #     # "https://walker.cachix.org"
       #   ];      
       #   trusted-public-keys = [
       #     "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
       #     "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
       #     # "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
       #   ];
       };
        extraOptions = ''
          experimental-features = nix-command flakes
          builders-use-substitutes = true
        '';
      };
      programs.nix-ld.enable = true;
      programs.nix-ld.libraries = with pkgs; [
        # Add any missing dynamic libraries for unpackaged programs
        # here, NOT in environment.systemPackages
      ];
      system.stateVersion = "23.11";
    };
  
}
