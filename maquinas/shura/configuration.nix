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
    };
  };
}
