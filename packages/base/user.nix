{ config, ... }:

{
  config = {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    users.mutableUsers = true;
  };
}
