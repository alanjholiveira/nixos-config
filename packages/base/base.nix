/*
  A trait for all boxxen
*/
{ config, pkgs, lib, ... }:

{
  config = {
    # time.timeZone = "America/Sao_Paulo";
    # # Windows wants hardware clock in local time instead of UTC
    # time.hardwareClockInLocalTime = true;
    
    # services.xserver = {
    #   xkb = {
    #     layout = "br,us";
    #     model = "pc104";
    #     variant = "";
    #     options = "terminate:ctrl_alt_bksp"; #"grp:caps_toggle,grp_led:scroll"
    #   };
    # };

    # i18n.defaultLocale = "en_US.UTF-8";
    # # i18n.supportedLocales = [ "all" ];
    # i18n.extraLocaleSettings = {
    #   LC_ADDRESS = "pt_BR.UTF-8";
    #   LC_IDENTIFICATION = "pt_BR.UTF-8";
    #   LC_MEASUREMENT = "pt_BR.UTF-8";
    #   LC_MONETARY = "pt_BR.UTF-8";
    #   LC_NAME = "pt_BR.UTF-8";
    #   LC_NUMERIC = "pt_BR.UTF-8";
    #   LC_PAPER = "pt_BR.UTF-8";
    #   LC_TELEPHONE = "pt_BR.UTF-8";
    #   LC_TIME = "pt_BR.UTF-8";
    # };

    # environment.systemPackages = with pkgs; [
    #   # Shell utilities
    #   zsh-powerlevel10k
    #   wget
    #   patchelf
    #   direnv
    #   nix-direnv
    #   git
    #   # jq
    #   # fzf
    #   # ripgrep
    #   # lsof
    #   htop
    #   # bat
    #   # grex
    #   broot
    #   bottom
    #   fd
    #   # sd
    #   # fio
    #   # hyperfine
    #   tokei
    #   bandwhich
    #   lsd
    #   ntfs3g
    #   # nvme-cli
    #   # nvmet-cli
    #   # libhugetlbfs # This has a build failure.
    #   killall
    #   gptfdisk
    #   # fio
    #   smartmontools
    #   # helix
    #   # rnix-lsp
    #   # graphviz
    #   # simple-http-server
    #   # clinfo
    # ];
    # environment.shellAliases = { };
    # environment.variables = {
    #   EDITOR = "${pkgs.vscode}/bin/code";
    # };
    # environment.pathsToLink = [
    #   "/share/nix-direnv"
    # ];

    # programs.bash.promptInit = ''
    #   eval "$(${pkgs.starship}/bin/starship init bash)"
    # '';
    # programs.bash.shellInit = ''
    # '';
    # # programs.bash.loginShellInit = ''
    # #   HAS_SHOWN_NEOFETCH=''${HAS_SHOWN_NEOFETCH:-false}
    # #   if [[ $- == *i* ]] && [[ "$HAS_SHOWN_NEOFETCH" == "false" ]]; then
    # #     ${pkgs.neofetch}/bin/neofetch --config ${../config/neofetch/config}
    # #     HAS_SHOWN_NEOFETCH=true
    # #   fi
    # # '';
    # programs.bash.interactiveShellInit = ''
    #   eval "$(${pkgs.direnv}/bin/direnv hook bash)"
    #   source "${pkgs.fzf}/share/fzf/key-bindings.bash"
    #   source "${pkgs.fzf}/share/fzf/completion.bash"
    # '';
    # programs.zsh.enable = true;

    # security.sudo.wheelNeedsPassword = false;
    # security.sudo.extraConfig = ''
    #   Defaults lecture = never
    # '';

    # Use edge NixOS.
    # nix.extraOptions = ''
    #   experimental-features = nix-command flakes
    #   builders-use-substitutes = true
    # '';
    # nix.package = pkgs.nixUnstable;

    # home-manager.useGlobalPkgs = true;
    # home-manager.useUserPackages = true;
    # users.mutableUsers = true;
    # nixpkgs.config.allowUnfree = true;

    # Hack: https://github.com/NixOS/nixpkgs/issues/180175
    # systemd.services.systemd-udevd.restartIfChanged = false;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    # system.stateVersion = "23.11"; # Did you read the comment?
  };
}
