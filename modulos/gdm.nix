{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;

  # Configurar teclado en X11
  services.xserver = {
    layout = "latam";
    xkbVariant = "";
  };
}
