{ 
  config,
  pkgs,
  pkgs-unstable,
  ... }:

{
  home.packages = with pkgs; [
    microsoft-edge
    nyxt
  ];

  programs = {
    qutebrowser = {
      enable = true;
      package = pkgs-unstable.qutebrowser;
      loadAutoconfig = false;
      
      settings = {
        auto_save.session = true;
	      content.pdfjs = true;
      };

      keyBindings = {
        normal = {
	        # Movimiento en historia de navegación
          "<Ctrl+j>" = "back";
          "<Ctrl+k>" = "forward";
	        # Movimiento entre pestañas
          "<Ctrl+h>" = "tab-prev";
          "<Ctrl+l>" = "tab-next";
	        # Gestión de pestañas
          "<Space>bn" = "tab-give";
          "<Space>be" = "tab-close";
          # Apertura o ejecución externa
          "<Space>ov" = "int links spawn mpv {hint-url}";
          "<Space>of" = "pawn firefox {url}";
        };
        
        command = {
          "<Ctrl+j>" = "completion-item-focus next";
          "<Ctrl+k>" = "completion-item-focus prev";
	      };
      };

      extraConfig = "config.unbind('H')\nconfig.unbind('L')";

      aliases = {
        q = "close";
        pensaSis9 = "open -t https://campusvirtuallms.javeriana.edu.co/d2l/home/227750";
        pensaSis2 = "open -t https://campusvirtuallms.javeriana.edu.co/d2l/home/227751";
      };
      
      searchEngines = {
        # Búsquedas generales
        DEFAULT = "https://duckduckgo.com/?q={}";
        go = "https://www.google.com/search?hl=en&q={}";
        am = "https://www.amazon.com/s?k={}";
        # Bibliografía y libros
        cr = "https://search.crossref.org/?from_ui=&q={}";
        gs = "https://scholar.google.com/scholar?q={}"; 
        gr = "https://www.goodreads.com/search?query={}";
        lgnf = "http://libgen.is/search.php?req={}"; 
        lgf = "https://libgen.is/fiction/?q={}"; 
        sc = "https://www.scimagojr.com/journalsearch.php?q={}";
        # NixOS
        np = "https://search.nixos.org/packages?query={}";
        no = "https://search.nixos.org/options?query={}";
	      nh = "https://mipmip.github.io/home-manager-option-search/?query={}";
        # Redes sociales
        re = "https://www.reddit.com/r/{}"; 
        yt = "https://www.youtube.com/results?search_query={}";
      };
    };

    firefox = {
      enable = true;
    };

    chromium = {
      enable = true;
      extensions = [
        { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      ];
    };
  };

  xdg.mimeApps = {
    enable = true;
    
    defaultApplications = {
      "text/html" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/http" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/https" = "org.qutebrowser.qutebrowser.desktop";
    };
  };
}
  
