{
  description = "Hoverbear's Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # flake-utils.url = "github:numtide/flake-utils";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      # url = "github:K900/NixOS-WSL/native-systemd";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nbr = {
    #   url = "github:nixosbrasil/nixpkgs-brasil";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.flake-utils.follows = "flake-utils";
    # };
  };

  outputs = { self, nixpkgs, nixos-wsl, home-manager }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);
    in
    {
      overlays.default = final: prev: {
        fix-vscode = final.callPackage ./packages/fix-vscode { };
      };

      packages = forAllSystems
        (system:
          let
            pkgs = import nixpkgs {
              inherit system;
              overlays = [ self.overlays.default ];
              config.allowUnfree = true;
            };
          in
          {
            inherit (pkgs) fix-vscode;

            # Excluded from overlay deliberately to avoid people accidently importing it.
            unsafe-bootstrap = pkgs.callPackage ./packages/unsafe-bootstrap { };
          });

      homeConfigurations = forAllSystems
          (system:
            let
              pkgs = import nixpkgs {
                inherit system;
                overlays = [ self.overlays.default ];
              };
            in
            {
              alan = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                  ./users/alan/home.nix
                ];
              };
            }
          );

       nixosConfigurations =
        let
          x86_64Base = {
            system = "x86_64-linux";
            modules = with self.nixosModules; [
              ({ config = { nix.registry.nixpkgs.flake = nixpkgs; }; })
              home-manager.nixosModules.home-manager
              packages.overlay
              packages.base
            ];
          };
        in
        with self.nixosModules; {
          x86_64IsoImage = nixpkgs.lib.nixosSystem {
            inherit (x86_64Base) system;
            modules = x86_64Base.modules ++ [
              platforms.iso
            ];
          };
          aarch64IsoImage = nixpkgs.lib.nixosSystem {
            inherit (aarch64Base) system;
            modules = aarch64Base.modules ++ [
              platforms.iso
              {
                config = {
                  virtualisation.vmware.guest.enable = nixpkgs.lib.mkForce false;
                  services.xe-guest-utilities.enable = nixpkgs.lib.mkForce false;
                };
              }
            ];
          };
          wsl = nixpkgs.lib.nixosSystem {
            inherit (x86_64Base) system;
            modules = x86_64Base.modules ++ [
              nixos-wsl.nixosModules.wsl
              platforms.wsl
              users.alan
            ];
          };

           wsl-alienware = nixpkgs.lib.nixosSystem {
            inherit (x86_64Base) system;
            modules = x86_64Base.modules ++ [
              nixos-wsl.nixosModules.wsl
              platforms.wsl
              packages.interface.gnome
              packages.app.docker
              system.shell.zsh
              users.alan
              packages.app.vscode
            ];
          };

          alienware = nixpkgs.lib.nixosSystem {
            inherit (x86_64Base) system;
            modules = x86_64Base.modules ++ [
              platforms.intel
              system.hardware
              system.security
              hardwares.alienware
              packages.interface.gnome
              users.alan
              packages.app.docker
              packages.app.flatpak
            ];
          };
        };

      nixosModules = {
        platforms.container = ./platforms/container.nix;
        platforms.wsl = ./platforms/wsl.nix;
        platforms.intel = ./platforms/intel.nix;
        platforms.iso-minimal = "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix";
        platforms.iso = "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix";
        
        packages.overlay = { nixpkgs.overlays = [ self.overlays.default ]; };
        packages.base = ./packages/base;
        packages.interface.gnome = ./packages/interface/gnome;
        packages.interface.hyprland = ./packages/interface/hyprland;

        packages.app.docker = ./packages/app/docker.nix;
        packages.app.flatpak = ./packages/app/flatpak.nix;
        packages.app.jetbrains = ./packages/app/jetbrains.nix;
        packages.app.virtualisation = ./packages/app/virtualisation.nix;
        packages.app.vscode = ./packages/app/vscode.nix;

        system.hardware = ./system/hardware;
        system.security = ./system/security;
        system.shell.zsh = ./system/shell/zsh.nix;
        system.shell.bash = ./system/shell/bash.nix;
        system.source-build = ./system/source-build.nix;

        hardwares.alienware = ./hardwares/alienware;

        users.alan = ./users/alan;
      };

     checks = forAllSystems (system:
       let
         pkgs = import nixpkgs {
           inherit system;
           overlays = [ self.overlays.default ];
         };
       in
       {
         format = pkgs.runCommand "check-format"
           {
             buildInputs = with pkgs; [ rustfmt cargo ];
           } ''
           ${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt --check ${./.}
           touch $out # it worked!
         '';
      });

    };
}
