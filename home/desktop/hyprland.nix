{ 
  config,
  pkgs,
  pkgs-unstable,
  vars,
  ... }:
{
  home.packages = with pkgs; [
    hyprpaper
    hyprcursor
    rose-pine-hyprcursor
    waylock
    blueman                     # Gestor de conexiones bluetooth
    networkmanagerapplet	# Gestor de red en tray
    gtklock
    pkgs-unstable.grimblast
    alsa-utils                  # Para control de volumen
    brightnessctl               # Para control de brillo en pantalla
    jq                          # Para scripts de eww
    socat                       # Para scripts de eww
    wirelesstools               # Para scripts de eww
    wl-clipboard                # Para pantallazos en wayland
  ];

  services = {
    gnome-keyring.enable = true;
    network-manager-applet.enable = true;
  };
 
  # Configuración de tema GTK 
  gtk = {
    enable = true;
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
    iconTheme = {
      package = pkgs.zafiro-icons;
      name = "Zafiro-icons-Dark";
    };
  };

  programs = {
    waybar.enable = true;
    wofi = {
      enable = true;
      settings = {
        term = "alacritty";
      };
    };
    wlogout.enable = true;
    eww = {
      enable = true;
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
