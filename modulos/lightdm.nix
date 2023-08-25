{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.greeters.slick.enable = true;

  # Configurar teclado en X11
  services.xserver = {
    layout = "latam";
    xkbVariant = "";
  };
}
