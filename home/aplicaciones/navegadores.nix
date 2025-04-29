{ 
  config,
  pkgs,
  pkgs-unstable,
  nur-pkgs,
  ... }:

{
  home.packages = with pkgs; [
    microsoft-edge
    nyxt
  ];

  programs = {
    qutebrowser = {
      enable = true;
      package = pkgs.qutebrowser;
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
        pensaSis = "open -t https://campusvirtuallms.javeriana.edu.co/d2l/home/262685";
        proyEmp = "open -t https://campusvirtuallms.javeriana.edu.co/d2l/home/262887";
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
	      nh = "https://home-manager-options.extranix.com/?query={}";
        # Redes sociales
        re = "https://www.reddit.com/r/{}"; 
        yt = "https://www.youtube.com/results?search_query={}";
      };
    };

    firefox = {
      enable = true;
      package = pkgs.firefox;
      profiles.default = {
        settings = {
          "extensions.autoDisableScopes" = 0;
          "browser.startup.page" = 3; # Restaura sessión anterior al abrir
          "browser.download.useDownloadDir" = false; # Pregunta por carpeta para descargas
        };
        search = {
          engines = {
            "Scimago JR" = {
              urls = [{ template = "https://www.scimagojr.com/journalsearch.php?q={searchTerms}"; }];
              definedAliases = [ "sc" ];
            };
            "Libgen ficción" = {
              urls = [{ template = "https://libgen.is/fiction/?q={searchTerms}"; }];
              definedAliases = [ "lgf" ];
            };
            "Libgen no-ficción" = {
              urls = [{ template = "http://libgen.is/search.php?req={searchTerms}"; }];
              definedAliases = [ "lgnf" ];
            };
            "Goodreads" = {
              urls = [{ template = "https://www.goodreads.com/search?query={searchTerms}"; }];
              definedAliases = [ "gr" ];
            };
            "Google scholar" = {
              urls = [{ template = "https://scholar.google.com/scholar?q={searchTerms}"; }];
              definedAliases = [ "gs" ];
            };
            "Crossref" = {
              urls = [{ template = "https://search.crossref.org/?from_ui=&q={searchTerms}"; }];
              definedAliases = [ "cr" ];
            };
            "Youtube" = {
              urls = [{ template = "https://www.youtube.com/results?search_query={searchTerms}"; }];
              definedAliases = [ "yt" ];
            };
            "Reddit - sub" ={
              urls = [{ template = "https://www.reddit.com/r/{searchTerms}"; }];
              definedAliases = [ "rs" ];
            };
            "Home-manager options" = {
              urls = [{ template = "https://home-manager-options.extranix.com/?query={searchTerms}"; }];
              # iconUpdateURL = "https://wiki.nixos.org/favicon.png";
              # updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "nh" ];
            };
            "Nix options" = {
              urls = [{ template = "https://search.nixos.org/options?query={searchTerms}"; }];
              definedAliases = [ "no" ];
            };
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "np" ];
            };
          };
        };
        extensions = with nur-pkgs.repos.rycee.firefox-addons; [
          privacy-badger
          zotero-connector
          ublock-origin
          vimium
        ];
      };
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
  
