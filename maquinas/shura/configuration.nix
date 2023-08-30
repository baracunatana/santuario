{ config, pkgs, ... }: {

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Nombre del host
  networking.hostName = "shura"; 

  # Parámetros para home-manager
  home-manager.extraSpecialArgs = {
    vars = {
      hypr-monitores-config = ''
        monitor=HDMI-A-1,1920x1080,1080x0,1
        monitor=DP-1,preferred,0x0,1, transform,1
      '';
      hyprpaper-config = ''
        # Los fondos de escritorio para shura se recortan con https://mmw.drath.ru/

        # Precarga de imágenes
        preload = ~/.config/wallpapers/london-vert.png
        preload = ~/.config/wallpapers/london-hor.png

        # Definir los fondos de escritorio por pantalla
        wallpaper = DP-1,~/.config/wallpapers/london-vert.png
        wallpaper = HDMI-A-1,~/.config/wallpapers/london-hor.png
      '';
    };
  };
}
