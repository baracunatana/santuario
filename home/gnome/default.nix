{ 
  config,
  pkgs,
  ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.gsconnect
    gnomeExtensions.appindicator # Util para Teams y davmail
  ];

  dconf.settings = {
    # Mapear caps_lock a ctrl
    "org/gnome/desktop/input-sources" = {
    xkb-options = ["caps:ctrl_modifier" "lv3:ralt_switch"];
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [ "appindicatorsupport@rgcjonas.gmail.com"  # Para íconos en tray
                             "gsconnect@andyholmes.github.io"];        # Para gsconnect
    };

    # Desactivar M-Space en gnome
    "org/gnome/desktop/wm/keybindings" = {
      activate-window-menu = [];
    };

  };
}
