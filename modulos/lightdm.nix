{pkgs, ...}: {

 services = {
  	xserver = {
      enable = true;
      xkb = {
        layout = "latam";
        variant = "";
      };
      displayManager.lightdm = {
        enable = true;
        greeters.slick = {
          enable = true;
          extraConfig = ''
                  background=/etc/lightdm/jardin.jpg
                  '';
        };
      };
    };

    gnome.gnome-keyring.enable = true;
  };

  security.pam.services.gdm.enableGnomeKeyring = true;
  
  environment.etc."lightdm/jardin.jpg".source = ../wallpapers/jardin.jpg;
}
