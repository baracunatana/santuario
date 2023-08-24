{ 
  config,
  pkgs,
  ... }:

{
  home.packages = with pkgs; [
    (python310.withPackages (ps:
      with ps; [
        debugpy
        ipython
        pandas
      ]))
    pyright #LSP para python usado desde Emacs
  ];
  
  programs = {
  };
}
