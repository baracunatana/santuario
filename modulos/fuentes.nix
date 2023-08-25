{pkgs, ...}: {

  fonts.fonts = with pkgs; [ 
    nerdfonts
    inconsolata-lgc
    eb-garamond
    vistafonts
    emacs-all-the-icons-fonts
  ];

}
