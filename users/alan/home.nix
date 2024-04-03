{ config, pkgs, lib, ... }:

{
  home.username = "alan";
  home.homeDirectory = "/home/alan";

  programs.git = {
    enable = true;
    userName = "Alan Oliveira";
    userEmail = "alanjhone@gmail.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  gtk = {
    enable = true;
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  # Use `dconf watch /` to track stateful changes you are doing, then set them here.
  dconf.settings = let inherit (lib.hm.gvariant) mkTuple mkUint32 mkVariant; in {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      disable-extension-version-validation = false;
      # `gnome-extensions list` for a list
      enabled-extensions = [
      #   "user-theme@gnome-shell-extensions.gcampax.github.com"
        "trayIconsReloaded@selfmade.pl"
        "Vitals@CoreCoding.com"
      ];
      # favorite-apps = [ "firefox.desktop" "code.desktop" "org.gnome.Terminal.desktop" "spotify.desktop" "virt-manager.desktop" "org.gnome.Nautilus.desktop" ];
      favorite-apps = [ "microsoft-edge.desktop" "org.gnome.Calendar.desktop" "org.gnome.Nautilus.desktop" "code.desktop" "org.gnome.Console.desktop" ];
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      workspaces-only-on-primary = true;
      center-new-windows = true;
      edge-tiling = true;
    };
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = false;
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };
    "org/gnome/desktop/wm/preferences" = {
      workspace-names = [ "Main" ];
      button-layout = "appmenu:close";
    };
    "org/gnome/shell/extensions/vitals" = {
      show-storage = false;
      show-voltage = true;
      show-memory = true;
      show-fan = true;
      show-temperature = true;
      show-processor = true;
      show-network = true;
    };
    "org/gnome/desktop/background" = {
      picture-uri = "file://${./midnight-reflections-moonlit-sea.jpg}";
      picture-uri-dark = "file://${./midnight-reflections-moonlit-sea.jpg}";
    };
    # "org/gnome/desktop/screensaver" = {
    #   picture-uri = "file://${./saturn.jpg}";
    #   primary-color = "#3465a4";
    #   secondary-color = "#000000";
    # };
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
    };
    "org/gnome/desktop/peripherals/mouse" = {
       speed = 1.0;
    };
    "org/nome/desktop/input-sources" = {
      mru-sources = [ (mkTuple [ "xkb" "us" ]) ];
      sources = [ (mkTuple [ "xkb" "br" ]) (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];

       #sources = [
        #("xkb", "br"),
        #("xkb", "us")
        #(mkTuple [ "xkb" "br" ])
        #(mkTuple [ "xkb" "us" ])
      #];
      #xkb-options = [ "terminate:ctrl_alt_bksp" "caps:ctrl_modifier" ]; #['terminate:ctrl_alt_bksp']
    };
  };

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
    #  miguelsolorio.symbols
    #  miguelsolorio.min-theme
    # streetsidesoftware.code-spell-checker-portuguese-brazilian
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

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableVteIntegration = true;
    history.save = 10000;
    history.size = 10000;
    initExtra = ''
      # End of lines configured by zsh-powerlevel10k-install
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      # End of line configured by asdf-vm
      source ${pkgs.asdf-vm}/share/asdf-vm/asdf.sh
    '';
  };

  home.file = {
    ".p10k.zsh" = {
      source = ../../config/powerlevel10k/.p10k.zsh;
      executable = true;
    };
    # ".zshrc" = {
    #   source = ../../dotfiles/zshrc;
    #   executable = true;
    # };

  };

  # xdg.configFile."libvirt/qemu.conf".text = ''
  #   nvram = ["/run/libvirt/nix-ovmf/OVMF_CODE.fd:/run/libvirt/nix-ovmf/OVMF_VARS.fd"]
  # '';

  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}
