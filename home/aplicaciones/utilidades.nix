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
