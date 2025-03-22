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
        tabulate
        streamlit
        shiny
      ]))
    pyright #LSP para python usado desde Emacs
  ];
  
  programs = {
  };
}
