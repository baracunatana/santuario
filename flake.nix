{
  description = "Flake principal para equipo de trabajo completo";

  inputs = {
    # Repositorio estable a 24.05 
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    # Repositorio de versión anterior 
    nixpkgs-legacy.url = "github:NixOS/nixpkgs/nixos-24.05";

    # Repositorio inestable
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix User Repository (NUR). Lo uso para extensiones de firefox
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{self, nixpkgs, nixpkgs-legacy, nixpkgs-unstable, home-manager, nur, ... }: {
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
          nur-pkgs = import nur {
            nurpkgs = nixpkgs.legacyPackages.x86_64-linux;
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
          };
        };
        
        modules = [
          ./modulos/comun.nix
          ./modulos/hyprland.nix
          ./modulos/gnome.nix
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
          nur-pkgs = import nur {
            nurpkgs = nixpkgs.legacyPackages.x86_64-linux;
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
          };
	      };

        modules = [
          ./modulos/comun.nix
          ./modulos/hyprland.nix
          ./modulos/gnome.nix
          ./modulos/fuentes.nix
          #./modulos/sddm.nix
          #./modulos/gdm.nix
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
