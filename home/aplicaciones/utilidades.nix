{ 
  config,
  pkgs,
  pkgs-unstable,
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
    teams-for-linux
    tree
    unzip
    zip
    zoom-us
    zotero
    pkgs-unstable.superfile
    gnome.nautilus
    fzf
    ripdrag
  ];

  programs = {
    yazi = {
      enable = true;
    };
  };
}
