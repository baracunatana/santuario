{
  description = "Flake principal para equipo de trabajo completo";

  inputs = {
    # Repositorio estable a 24.05 
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    # Repositorio de versión anterior 
    nixpkgs-legacy.url = "github:NixOS/nixpkgs/nixos-23.05";

    # Repositorio inestable
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{self, nixpkgs, nixpkgs-legacy, nixpkgs-unstable, home-manager, ... }: {
    nixosConfigurations = {
      "shura" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

	      # El parámetro `specialArgs` pasa la instancia de nixpkgs inestable a otros módulos.
        # No es accesible desde home-manager, en donde toca hacer su propia configuración
        specialArgs = {
	        pkgs-legacy = import nixpkgs-legacy {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
	        pkgs-unstable = import nixpkgs-unstable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
        };

        modules = [
          ./modulos/comun.nix
          ./modulos/hyprland.nix
          ./modulos/fuentes.nix
          #./modulos/sddm.nix
          ./modulos/gdm.nix
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

        # El parámetro `specialArgs` pasa la instancia de nixpkgs inestable a otros módulos.
        # No es accesible desde home-manager, en donde toca hacer su propia configuración
        specialArgs = {
	        pkgs-legacy = import nixpkgs-legacy {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
          pkgs-unstable = import nixpkgs-unstable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
	      };

        modules = [
          ./modulos/comun.nix
          ./modulos/hyprland.nix
          ./modulos/fuentes.nix
          #./modulos/sddm.nix
          ./modulos/gdm.nix
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
