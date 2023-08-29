{ config, pkgs, ... }: {

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Nombre del host
  networking.hostName = "shion"; 

  # Parámetros para home-manager
  home-manager.extraSpecialArgs = {
    vars = {
      hypr-monitores-config = ''
        monitor=HDMI-A-1,1920x1080,1366x0,1
        monitor=eDP-1,preferred,0x0,1
      '';
    };
  };
}
