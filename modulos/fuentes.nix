{pkgs, ...}: {

  fonts.packages = with pkgs; [ 
    nerdfonts
    inconsolata-lgc
    eb-garamond
    vistafonts
    emacs-all-the-icons-fonts
    open-sans
  ];

}
