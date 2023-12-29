{ config, pkgs, vars, ... }:
{
  home.packages = with pkgs; [
    hyprpaper
    waylock
    gtklock
    alsa-utils                  # Para control de volumen
    brightnessctl               # Para control de brillo en pantalla
    jq                          # Para scripts de eww
    socat                       # Para scripts de eww
  ];

  programs = {
    waybar.enable = true;
    wofi.enable = true;
    wlogout.enable = true;
    eww = {
      enable = true;
      package = pkgs.eww-wayland;
      configDir = ./eww-config-dir;
    };
  };

  # Crear archivo de configuración de monitores según var.hypr-monitores.
  # Esta variable debes estar definida en los módulos propios de las máquinas 
  home.file.".config/hypr/hypr-monitores.conf".text = vars.hypr-monitores-config;

  # Crear archivo de configuración de fondos de pantalla con hyprpaper según var.hyprpaper-config. 
  # Esta variable debes estar definida en los módulos propios de las máquinas 
  home.file.".config/hypr/hyprpaper.conf".text = vars.hyprpaper-config;
  
  # Archivos de configuración para todo el ecosistema.
  # Se editan en la carpeta ./hyprland-config
  home.file = {
    ".config/hypr" = {
      source = ./hyprland-config;
      recursive = true;
    };
  };
}
