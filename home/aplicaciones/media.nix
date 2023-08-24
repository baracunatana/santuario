{ 
  config,
  pkgs,
  ... }:

{
  home.packages = with pkgs; [
    pinta
    spotify
  ];
    
  programs = {
    mpv = {
      enable = true;
    };
  };
}
