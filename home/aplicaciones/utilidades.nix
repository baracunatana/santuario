{ 
  config,
  pkgs,
  ... }:

{
  home.packages = with pkgs; [
    archi                       # Modelador de archimate
    blueman                     # Gestor de conexiones bluetooth
    bottom                      # Gestor de procesos
    jabref
    keepassxc
    neofetch
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
  ];
    
  programs = {
  };
}
