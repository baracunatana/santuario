{ config, pkgs, vars, ... }: {

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Nombre del host
  networking.hostName = "shion"; 

  # Parámetros para home-manager
  home-manager.extraSpecialArgs = {
    vars = {
      hypr-monitores-config = ''
        monitor=eDP-1,1366x768,0x0,1
        monitor=HDMI-A-1,1920x1080,1366x0,1
      '';
      hyprpaper-config = ''
        # Los fondos de escritorio para shura se recortan con https://mmw.drath.ru/

        # Precarga de imágenes
        preload = ~/.config/wallpapers/goku.png

        # Definir los fondos de escritorio por pantalla
        wallpaper = eDP-1,~/.config/wallpapers/goku.png
        wallpaper = HDMI-A-1,~/.config/wallpapers/goku.png
      '';

    };
  };
}
