{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;

  security.pam.services.sddm.enableGnomeKeyring = true;

  # Configurar teclado en X11
  services.xserver.xkb = {
    layout = "latam";
    variant = "";
  };
}
