{ config, pkgs, lib, ... }:

{
    config = {
        # programs.dconf.enable = true;

        # Use `dconf watch /` to track stateful changes you are doing, then set them here.
        dconf.settings = let inherit (lib.hm.gvariant) mkTuple mkUint32 mkVariant; in {
            "org/gnome/shell" = {
                disable-user-extensions = false;
                disable-extension-version-validation = false;
                enabled-extensions = [
                    "trayIconsReloaded@selfmade.pl"
                    "Vitals@CoreCoding.com"
                ];
                # favorite-apps = [ "microsoft-edge.desktop" "org.gnome.Calendar.desktop" "org.gnome.Nautilus.desktop" "code.desktop" "org.gnome.Console.desktop" ];
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
            # "org/gnome/desktop/background" = {
                # picture-uri = "file://${./midnight-reflections-moonlit-sea.jpg}";
                # picture-uri-dark = "file://${./midnight-reflections-moonlit-sea.jpg}";
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
            };
        };
    };

}