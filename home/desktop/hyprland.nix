{ 
  config,
  pkgs,
  pkgs-unstable,
  vars,
  ... }:
{
  home.packages = with pkgs; [
    hyprpaper
    hyprcursor
    rose-pine-hyprcursor
    networkmanagerapplet	      # Gestor de red en tray
    pkgs-unstable.grimblast
    alsa-utils                  # Para control de volumen
    brightnessctl               # Para control de brillo en pantalla
    jq                          # Para scripts de eww
    socat                       # Para scripts de eww
    wirelesstools               # Para scripts de eww
    wl-clipboard                # Para pantallazos en wayland
  ];

  services = {
    swaync.enable = true;
    blueman-applet.enable = true;
    gnome-keyring.enable = true;
    network-manager-applet.enable = true;
  };

  home.sessionVariables = {
    TERMINAL = "alacritty";
  };

  xdg.configFile."mimeapps.list".text = ''
    [Default Applications]
    x-scheme-handler/terminal=alacritty.desktop
  '';

  xdg.desktopEntries.alacritty = {
    name = "Alacritty";
    genericName = "Terminal Emulator";
    exec = "alacritty -e %c";
    terminal = false;
    categories = [ "System" "TerminalEmulator" ];
    mimeType = [ "x-scheme-handler/terminal" ];
  };

  # Configuración de tema GTK 
  gtk = {
    enable = true;
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
    iconTheme = {
      package = pkgs.zafiro-icons;
      name = "Zafiro-icons-Dark";
    };
  };

  programs = {
    hyprlock = {
      enable = true;
      settings = {
        general = {
          no_fade_in = false;
        };
        background = {
          path = "screenshot";
          blur_passes = 2;
          blur_size = 8;
        };
        input-field = {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          shadow_passes = 2;
        };
      };
    };
    waybar = {
      enable = true;
      settings = {
        mainBar = {
          modules-left = [ "hyprland/workspaces" "mpris" ];
          modules-center = [ "idle_inhibitor" "hyprland/window" ];
          modules-right = [ "pulseaudio" "battery" "network" "clock" "tray" "custom/notification" "custom/power" ];
          mpris = {
            format = "DEFAULT: {player_icon} {dynamic}";
            format-paused = "DEFAULT: {status_icon} <i>{dynamic}</i>";
            player-icons = {
              default = "▶";
              mpv = "🎵";
            };
            status-icons = {
              paused = "⏸";
            };
          };
          "custom/notification" = {
            format = "{icon}";
            format-icons = {
              notification = "<span foreground='red'><sup></sup></span>";
              none = "";
              dnd-notification = "<span foreground='red'><sup></sup></span>";
              dnd-none = "";
              inhibited-notification = "<span foreground='red'><sup></sup></span>";
              inhibited-none = "";
              dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
              dnd-inhibited-none = ";";
            };
            return-type = "json";
            exec-if = "which swaync-client";
            exec = "swaync-client -swb";
            on-click = "swaync-client -t -sw";
            on-click-right = "swaync-client -d -sw";
            escape = true;
          };
          "hyprland/workspaces" = {
            format = "{icon}";
            format-icons = {
              active = "";
              default = "";
            };
          };
          "hyprland/window" = {
            format = "{class} # {title}  ";
            max-length = 35;
            rewrite = {
              "emacs # (.*) - GNU Emacs (.*)" = "  > $1  ";
              "Alacritty # (.*): (.*)" = "  > $2  ";
              "Alacritty # nmtui" = "  > nmtui  ";
              "org.qutebrowser.qutebrowser # (.*) - qute(.*)" = "  > $1  ";
            };
            separate-outputs = true;
          };
          idle_inhibitor = {
            format = "{icon}";
            format-icons = {
              activated = "";
              deactivated = "";
            };
          };
          battery = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{icon}";
            format-icons = {
              default = [ "󰂎" "󰁻" "󰁽" "󰁿" "󰂁" "󰁹" ];
              charging = [ "󰢜" "󰂆" "󰂈" "󰂉" "󰂊" "󰂅" ];
              plugged = [ "" ];
            };
            tooltip = true;
          };
          tray = {
            icon-size = 13;
            spacing = 4;
          };
          clock = {
            tooltip-format = "<tt><small>{calendar}</small></tt>";
            format-alt = "{:%Y-%m-%d}";
            calendar = {
              mode = "year";
              mode-mon-col = 3;
              on-scroll = 1;
              format = {
                months = "<span color='#A3BE8C'><b>{}</b></span>";
                days = "<span color='#88C0D0'><b>{}</b></span>";
                weekdays = "<span color='#EBCB8B'><b>{}</b></span>";
                today = "<span color='#BF616A'><b><u>{}</u></b></span>";
              };
            };
          };
          pulseaudio = {
            format = "{icon} ";
            format-bluetooth = " ";
            format-bluetooth-muted = "󰂲";
            format-muted = "󰸈";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              default = [ "" "" "" ];
            };
            on-click = "pavucontrol";
          };
          "custom/power" = {
            format = " ";
            on-click = "wlogout";
          };
          network = {
            format-wifi = "{icon} ";
            format-ethernet = "  ";
            format-disconnected = "󰤭 ";
            tooltip-format-wifi = "{icon}  {essid} ({signalStrength}%)";
            tooltip-format-ethernet = "{icon} {ifname}";
            max-length = 20;
            on-click = "alacritty --title 'nmtui' -e 'nmtui'";
            format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
          };
        };
      };
      # El estilo css se define en archivos independientes que se
      # especifican más abajo en home.file..config
    };

    wofi = {
      enable = true;
      settings = {
        term = "alacritty";
      };
    };
    wlogout.enable = true;
    eww = {
      enable = true;
      configDir = ./eww-config-dir;
    };
  };

  # Crear archivo de configuración de monitores según var.hypr-monitores.
  # Esta variable debes estar definida en los módulos propios de las máquinas 
  home.file.".config/hypr/hypr-monitores.conf".text = vars.hypr-monitores-config;

  # Crear archivo de configuración de fondos de pantalla con hyprpaper según var.hyprpaper-config. 
  # Esta variable debes estar definida en los módulos propios de las máquinas 
  home.file.".config/hypr/hyprpaper.conf".text = vars.hyprpaper-config;
  
  # Archivos de configuración para todo el ecosistema.
  # Se editan en la carpeta ./hyprland-config
  home.file = {
    ".config/hypr" = {
      source = ./hyprland-config;
      recursive = true;
    };
    ".config/waybar/style.css".source = ./waybar/style.css;
  };
}
