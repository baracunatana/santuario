{ 
  config,
  pkgs,
  ... }:

{
  home.packages = with pkgs; [
    xterm
  ];
    
  programs = {
    alacritty = {
      enable = true;
      settings = {
        font.normal = {
	  family = "Inconsolata LGC";
	};
      };
    };
  };
}
