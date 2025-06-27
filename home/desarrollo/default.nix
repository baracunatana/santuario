{ 
  config,
  pkgs,
  ... }:

{
  home.packages = with pkgs; [
    (python3.withPackages (ps:
      with ps; [
        debugpy
        django
        ipython
        pandas
        matplotlib
        tabulate
        streamlit
        shiny
      ]))
    pyright
    basedpyright #LSP para python usado desde Emacs
  ];
}
