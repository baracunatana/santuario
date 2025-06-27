{pkgs, ...}: {

  fonts.packages = with pkgs; [ 
    nerd-fonts.symbols-only
    nerd-fonts.inconsolata-lgc
    inconsolata-lgc
    eb-garamond
    vistafonts
    emacs-all-the-icons-fonts
    open-sans
  ];

}
