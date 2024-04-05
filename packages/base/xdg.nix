{ config
, lib
, osConfig ? null
, ...
}:

let
  inherit (lib) mkIf;
  impermanence = osConfig.impermanence.enable or false;
in
{
  xdg = {
    enable = true;
    cacheHome = "${config.home.homeDirectory}/.cache";
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";
    binHome = "${config.home.homeDirectory}/.local/bin";

    mime.enable = true; # grep package mime types
    mimeApps.enable = true; # create $XDG_CONFIG_HOME/mimeapps.list
    # NOTE(samuelsung): The trash teams will override the mimeapps.list whenever I upload a picture even if there is no changes to the list
    # SEE: https://github.com/nix-community/home-manager/issues/1213
    configFile."mimeapps.list".force = true; # 

    userDirs = {
      enable = true;
      createDirectories = true;
      # desktop = null;
      # documents = null;
      # download = "${config.home.homeDirectory}/downloads";
      # music = "${config.home.homeDirectory}/music";
      # pictures = null;
      # publicShare = null;
      # templates = null;
      # videos = null;
    };
  };

  home.persistence."/persist/${config.home.homeDirectory}" = mkIf impermanence {
    directories = [
      "downloads"
    ];
    allowOther = true;
  };
}
