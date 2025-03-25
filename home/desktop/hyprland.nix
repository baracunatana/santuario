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
    blueman-applet.enable = true;
    gnome-keyring.enable = true;
    network-manager-applet.enable = true;
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
          modules-right = [ "pulseaudio" "battery" "network" "clock" "tray" "custom/power" ];
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
            format = "{icon}  {capacity}%";
            format-full = "{icon}  {capacity}%";
            format-charging = "{icon}  {capacity}%";
            format-plugged = "  {capacity}%";
            format-alt = "{time} {icon}";
            format-icons = [ "󰂎" "󰁻" "󰁽" "󰁿" "󰂁" "󰁹" ];
            format-charging-icons = [ "󰢜" "󰂆" "󰂈" "󰂉" "󰂊" "󰂅" ];
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
            format = "{icon} {volume}%";
            format-bluetooth = "  {volume}%";
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
            format-wifi = " {icon}  {essid} ";
            format-ethernet = " {ifname} ";
            format-disconnected = "󰤭";
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
    ".config/waybar/colors.css".source = ./waybar/colors.css;
  };
}
