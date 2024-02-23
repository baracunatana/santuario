{ 
  config,
  pkgs,
  pkgs-unstable,
  ... }:

{
  home.packages = with pkgs; [
    onlyoffice-bin
    libreoffice-fresh
    pandoc
    pkgs-unstable.mermaid-cli
    scantailor-advanced
    aspell
    aspellDicts.en
    aspellDicts.es
    xclip                       # Lo necesita org-download
  ];

  ## Configuración de aspell
  home.file.".aspell.conf".text = "data-dir /etc/profiles/per-user/juan/lib/aspell/";

  services.emacs = {
    startWithUserSession = "graphical";
    enable = true;
  };
  
  programs = {
    emacs = {
      enable = true;
      package = pkgs.emacs29-pgtk;
      extraPackages = epkgs: [ pkgs.mu ];
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
	  preprint      #Para authblk
	  pracjourn
          wrapfig;
      };
    };
  };
}
