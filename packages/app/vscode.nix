{ config, pkgs, ... }:
{
  config = {
    
    environment.systemPackages = with pkgs; [
      fix-vscode
      vscode
    ];
    # ++ (with pkgs.vscode-extensions;  [
    #   bbenoist.nix
    #   ms-vscode-remote.remote-ssh
    #   pkief.material-icon-theme
    #   github.github-vscode-theme
    #   editorconfig.editorconfig
    #   redhat.vscode-yaml
    #   ms-azuretools.vscode-docker
    #   streetsidesoftware.code-spell-checker
    # ]);

    environment.variables = {
      EDITOR = "${pkgs.vscode}/bin/code";
    };

  };
}
