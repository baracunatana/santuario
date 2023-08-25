{
  description = "Flake principal para equipo de trabajo completo";

  inputs = {
    # Official NixOS package source, using nixos-unstable branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";

    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      "shura" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./modulos/comun.nix
          ./modulos/hyprland.nix
          ./modulos/fuentes.nix
          ./modulos/lightdm.nix      
          ./modulos/pipewire.nix
          ./maquinas/shura/configuration.nix
          ./maquinas/shura/hardware-configuration.nix

	        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.juan = import ./home.nix;
          }
        ];
      };

      "shion" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./modulos/comun.nix
          ./modulos/hyprland.nix
          ./modulos/fuentes.nix
          ./modulos/lightdm.nix      
          ./modulos/pipewire.nix
          ./maquinas/shion/configuration.nix
          ./maquinas/shion/hardware-configuration.nix
          
	        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.juan = import ./home.nix;
          }
        ];
      };
    };
  };
}
