{pkgs, ...}: {
  # Enable the X11 windowing system.
  services = {
  	xserver = {
      enable = true;
      xkb = {
        layout = "latam";
        variant = "";
      };
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
    };

    gnome.gnome-keyring.enable = true;
  };

  security.pam.services.sddm.enableGnomeKeyring = true;
}
