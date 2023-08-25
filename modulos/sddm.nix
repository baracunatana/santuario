{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;

  # Configurar teclado en X11
  services.xserver = {
    layout = "latam";
    xkbVariant = "";
  };
}
