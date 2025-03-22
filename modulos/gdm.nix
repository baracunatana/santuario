{pkgs, lib, config, ...}:

let
  monitorsXmlContent = builtins.readFile ./activos/monitors-${config.networking.hostName}.xml;
  monitorsConfig = pkgs.writeText "gdm_monitors.xml" monitorsXmlContent;
in
{
  services = {
  	xserver = {
      xkb = {
        layout = "latam";
        variant = "";
      };
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };

    gnome.gnome-keyring.enable = true;
  };

  security.pam.services.gdm.enableGnomeKeyring = true;

  home-manager.backupFileExtension = "bck";

  systemd.tmpfiles.rules = [
    "L+ /run/gdm/.config/monitors.xml - - - - ${monitorsConfig}"
  ];
}
