{ 
  config,
  pkgs,
  pkgs-legacy,
  pkgs-unstable,
  ... }:

{
  home.packages = [
    pkgs.onlyoffice-bin
    pkgs.libreoffice-fresh
    pkgs.pandoc
    pkgs-unstable.mermaid-cli
    pkgs.scantailor-advanced
    pkgs.aspell
    pkgs.aspellDicts.en
    pkgs.aspellDicts.es
    pkgs.xclip                       # Lo necesita org-download
    pkgs.hugo
    pkgs-legacy.mu
  ];

  ## Configuración de aspell
  home.file.".aspell.conf".text = "data-dir /etc/profiles/per-user/juan/lib/aspell/";

  # services.emacs = {
  #   startWithUserSession = true;
  #   enable = true;
  # };
  
  programs = {
    emacs = {
      enable = true;
        package = pkgs.emacs-pgtk;
    };
    
    texlive = {
      enable = true;
      extraPackages = tpkgs: {
        inherit (tpkgs)
          scheme-medium
          # Paquetes adicionales
 	  currvita
 	  doi
 	  multibib
 	  multirow
 	  preview
          adjustbox
          amsfonts
          biber
          biblatex
          capt-of
          cm-super
          ebgaramond
          ec
          fontaxes
          sectsty
          titlesec
          orcidlink
 	  preprint      #Para authblk
 	  pracjourn
          wrapfig;
      };
    };
  };
}
