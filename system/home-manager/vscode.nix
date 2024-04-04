{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    google-chrome
    microsoft-edge
    # gnomeExtensions.user-themes
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.vitals
    fix-vscode
    asdf-vm
  ] ++ (if stdenv.isx86_64 then [
    # kicad
    # chromium
    # spotify
  ] else if stdenv.isAarch64 then [
    # spotifyd
  ] else [ ]);

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    
  #   # Workaround https://github.com/nix-community/home-manager/issues/3507
    mutableExtensionsDir = false;

    userSettings = {
      "workbench.colorTheme" = "GitHub Dark";
      "workbench.iconTheme" = "material-icon-theme";
      "editor.fontFamily" = "JetBrains Mono";
      "editor.fontSize" = 14;
      "editor.lineHeight" = 1.8;
      #"editor.rulers" = [80,120];
      "editor.formatOnSave" = true;
      "terminal.integrated.fontSize" = 14;
      "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";
      "terminal.integrated.showExitAlert" = false;
      "telemetry.telemetryLevel" = "off";
      "workbench.startupEditor" = "newUntitledFile";
  #     "remote.SSH.useLocalServer" = false;
    };
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      ms-vscode-remote.remote-ssh
      pkief.material-icon-theme
      github.github-vscode-theme
      editorconfig.editorconfig
      redhat.vscode-yaml
      ms-azuretools.vscode-docker
      streetsidesoftware.code-spell-checker
  
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
     # {
     #   name = "symbols";
     #   publisher = "miguelsolorio";
     #   version = "0.0.16";
     #   sha256 = "sha256-2c609eaa5783196bde27b28f61debe02bca7129113e31ae1bc8d87e0d3ee0ad4";
     # }
  #     {
  #       name = "hexeditor";
  #       publisher = "ms-vscode";
  #       version = "1.9.8";
  #       sha256 = "sha256-XgRD2rDSLf1uYBm5gBmLzT9oLCpBmhtfoabKBekldhg=";
  #     }
    ] ++ (if pkgs.stdenv.isx86_64 then with pkgs.vscode-extensions; [
  #     ms-python.python
  #     ms-vscode.cpptools
    ] else [ 
    ]);
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
