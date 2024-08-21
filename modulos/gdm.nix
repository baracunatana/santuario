{pkgs, lib, ...}:

let
  monitorsXmlContent = builtins.readFile ./activos/monitors-shura.xml;
  monitorsConfig = pkgs.writeText "gdm_monitors.xml" monitorsXmlContent;
in
{
  # Enable the X11 windowing system.
  services = {
  	xserver = {
      layout = "latam";
      xkbVariant = "";
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };

    gnome.gnome-keyring.enable = true;
  };

  security.pam.services.gdm.enableGnomeKeyring = true;

  systemd.tmpfiles.rules = [
    "L+ /run/gdm/.config/monitors.xml - - - - ${monitorsConfig}"
  ];
}
