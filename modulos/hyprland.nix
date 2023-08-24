{pkgs, hyprland, ...}: {

  programs.hyprland = {
      enable = true;
      xwayland.enable = true;
  };

  # Esto es necesario para que el bloqueo de sesión funcione correctamente
  security.pam.services.swaylock = { };
  security.pam.services.waylock = { };
  security.pam.services.gtklock = { };

  services = {
    # gvfs.enable = true; # Mount, trash, and other functionalities
    # tumbler.enable = true; # Thumbnail support for images
    xserver = {
      enable = true;

      desktopManager = {
        xterm.enable = false;
      };

      displayManager = {
        defaultSession = "hyprland";
        # lightdm.enable = false;
        gdm = {
          enable = true;
          wayland = true;
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-hyprland # Portal xdg para hyprland. Mejora tiempo de arranque de apps
    swaylock                    # Bloqueo de sesión 
    # swayidle # the idle timeout
    # wlogout # logout menu
    # wl-clipboard # copying and pasting
    # hyprpicker  # color picker
    
    # wf-recorder # creen recording
    # grim # taking screenshots
    # slurp # selecting a region to screenshot
    # TODO replace by `flameshot gui --raw | wl-copy`
    
    # mako # the notification daemon, the same as dunst
    
    # yad # a fork of zenity, for creating dialogs
    
    # audio
    # alsa-utils                 # provides amixer/alsamixer/...
    # mpd                        # for playing system sounds
    # mpc-cli                    # command-line mpd client
    # ncmpcpp                    # a mpd client with a UI
    # networkmanagerapplet       # provide GUI app: nm-connection-editor
    
    # xfce.thunar # xfce4's file manager
  ];
}
