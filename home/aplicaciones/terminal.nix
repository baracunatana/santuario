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
	      general.import = ["~/.config/alacritty/themes/themes/nord.toml"];
        font.normal = {
	        family = "Inconsolata LGC";
	      };
      };
    };
  };

  # A continuación se clona el repo de temas gráficos para alacritty
  home.file = {
    ".config/alacritty/themes".source = pkgs.fetchFromGitHub {
      owner = "alacritty";
      repo = "alacritty-theme";
      rev = "a4041ae";
      # Se consulta con nix-prefetch-github alacritty alacritty-theme
      sha256 = "A5Xlu6kqB04pbBWMi2eL+pp6dYi4MzgZdNVKztkJhcg=";
    };
  };
}
