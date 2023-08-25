{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm = {
    enable = true;
    greeters.slick = {
      enable = true;
      extraConfig = ''
        background=/etc/lightdm/jardin.jpg
      '';
    };
  };

  environment.etc."lightdm/jardin.jpg".source = ../wallpapers/jardin.jpg;

  # Configurar teclado en X11
  services.xserver = {
    layout = "latam";
    xkbVariant = "";
  };
}
