{ 
  config,
  pkgs,
  ... }:

{
  home.packages = with pkgs; [
    archi
    blueman                     # Gestor de conexiones bluetooth
    bottom                      # Gestor de procesos
    jabref
    keepassxc
    pavucontrol                 # Para control de volumen
    pdftk
    ripgrep
    ripgrep-all
    teams
    tree
    unzip
    zip
    zoom-us
    zotero
    xdotool
  ];
    
  programs = {
  };
}
