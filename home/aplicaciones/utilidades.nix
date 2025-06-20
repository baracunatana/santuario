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
    linssid            		      # Para mejorar conectividad de redes 5ghz
    neofetch
    iw                          # Para mejorar la búsqueda de redes 5ghz
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
    nautilus
    fzf
    ueberzugpp                  # Para imagenes en yazi
    ripdrag                     # Para incluir drag-n-drop en yazi
  ];

  programs = {
    # Explorador de archivos
    yazi = {
      enable = true;
      keymap = {
        manager.prepend_keymap = [
          { on = ["m" "d"];
            run = "shell 'ripdrag \"$@\" -x 2>/dev/null &' --confirm";
          }
        ];
      };
    };
  };
}
