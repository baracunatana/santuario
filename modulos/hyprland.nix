{pkgs, pkgs-unstable, hyprland, ...}: {

  programs.hyprland = {
      enable = true;
      xwayland.enable = true;
  };

  # Esto es necesario para que el bloqueo de sesión funcione correctamente
  security.pam.services.hyprlock = {};

  services = {
    # gvfs.enable = true; # Mount, trash, and other functionalities
    # tumbler.enable = true; # Thumbnail support for images
    xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
      };
    };

    displayManager = {
      defaultSession = "hyprland";
    };
  };

  hardware.graphics.enable = true;

  # environment.systemPackages = with pkgs; [
  #   pkgs-unstable.xdg-desktop-portal-hyprland # Portal xdg para hyprland. Mejora tiempo de arranque de apps
    # wlogout # logout menu
    
    # wf-recorder # creen recording
    # grim # taking screenshots
    # slurp # selecting a region to screenshot
    # TODO replace by `flameshot gui --raw | wl-copy`
    
    # mako # the notification daemon, the same as dunst
    
    # yad # a fork of zenity, for creating dialogs
    
    # audio
    # mpd                        # for playing system sounds
    # mpc-cli                    # command-line mpd client
    # ncmpcpp                    # a mpd client with a UI
    
    # xfce.thunar # xfce4's file manager
  # ];

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
    };
  };
}
