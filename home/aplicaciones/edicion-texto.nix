{ 
  config,
  pkgs,
  ... }:

{
  home.packages = with pkgs; [
    onlyoffice-bin
    libreoffice-fresh
    pandoc
    nodePackages.mermaid-cli
    scantailor-advanced
    aspell
    aspellDicts.en
    aspellDicts.es
    xclip                       # Lo necesita org-download
  ];
 
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
          adjustbox
          amsfonts
          biblatex
          biber
          capt-of
          cm-super
          ebgaramond
          ec
          fontaxes
          sectsty
          titlesec
          wrapfig;
      };
    };
  };
}
