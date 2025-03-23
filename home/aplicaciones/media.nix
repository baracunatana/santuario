{ 
  config,
  pkgs,
  pkgs-unstable,
  ... }:

{
  home.packages = with pkgs; [
    pinta
    spotify
    pkgs-unstable.spotifyd
  ];
   
  home.file.".config/spotifyd/spotifyd.conf".text =''
    [global]
    #username = "juanerasmoe@gmail.com"
    devicename = "shion"
    #password_cmd = "gpg2 -q --for-your-eyes-only --no-tty -d ~/.config/spotifyd.gpg"
    #bitrate = 320
    volume_normalisation = true
    device_type = "speaker"
    '';

  services = { 
    spotifyd = {
      enable = true;
      package = pkgs-unstable.spotifyd;
      settings = {
        global = {
          device_name = "nix";
          bitrate = 320;
          volume_normalisation = true;
        };
      };
    };
  };
  programs = {
    mpv = {
      enable = true;
    };
  };
}
