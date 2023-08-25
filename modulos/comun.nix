# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Bogota";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
   
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CO.UTF-8";
    LC_IDENTIFICATION = "es_CO.UTF-8";
    LC_MEASUREMENT = "es_CO.UTF-8";
    LC_MONETARY = "es_CO.UTF-8";
    LC_NAME = "es_CO.UTF-8";
    LC_NUMERIC = "es_CO.UTF-8";
    LC_PAPER = "es_CO.UTF-8";
    LC_TELEPHONE = "es_CO.UTF-8";
    LC_TIME = "es_CO.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "la-latin1";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Habilitar bluetootudo 
  hardware.bluetooth.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.juan = {
    isNormalUser = true;
    description = "juan";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Habilitar flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    vim
    wget
    gnupg
    pinentry
    curl
    git
    nano
    waydroid
  ];

  virtualisation.waydroid.enable=true;

  programs.git.config = {
    user.name = "Juan E. Gómez-Morantes";
    email.email = "juanerasmoe@gmail.com"; 
  };

  programs.gnupg.agent = {
     enable = true;
  };

  # Bloquear sitios web indeseados
  networking.extraHosts = ''
    127.0.0.1 www.facebook.com
    127.0.0.1 www.pulzo.com
    127.0.0.1 www.eltiempo.com
    127.0.0.1 www.elespectador.com
    127.0.0.1 www.semana.com
    127.0.0.1 www.netflix.com
    '';

  # Recolector de basura y optimización de almacenamiento usado por configuraciones previas
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };
  nix.settings.auto-optimise-store = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
