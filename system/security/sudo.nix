{ userSettings, pkgs, ... }:

{
  # Doas instead of sudo
  security.doas.enable = false;
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;
  security.sudo.extraConfig = ''
    Defaults lecture = never
  '';
  security.doas.extraRules = [{
    users = [ "${userSettings.username}" ];
    keepEnv = true;
    persist = true;
  }];

  environment.systemPackages = [
    (pkgs.writeScriptBin "sudo" ''exec doas "$@"'')
  ];
}
