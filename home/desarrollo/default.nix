{ 
  config,
  pkgs,
  ... }:

{
  home.packages = with pkgs; [
    (python3.withPackages (ps:
      with ps; [
        debugpy
        ipython
        pandas
        matplotlib
      ]))
    pyright #LSP para python usado desde Emacs
  ];
  
  programs = {
  };
}
