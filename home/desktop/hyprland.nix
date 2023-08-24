
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
    waylock
    gtklock
  ];

  programs = {
    waybar.enable = true;
    wofi.enable = true;
    wlogout.enable = true;
  };

  # Archivos de configuración para todo el ecosistema.
  # Se editan en la carpeta ./hyprland-config
  home.file.".config/hypr" = {
    source = ./hyprland-config;
    recursive = true;
  };
}
