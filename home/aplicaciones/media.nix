{ 
  config,
  pkgs,
  ... }:

{
  home.packages = with pkgs; [
    pinta
    spotify
    spotifyd
  ];
   
  home.file.".config/spotifyd/spotifyd.conf".text =''
    [global]
    username = "juanerasmoe@gmail.com"
    devicename = "shura"
    # password_cmd = "gpg2 -q --for-your-eyes-only --no-tty -d ~/.config/spotifyd.gpg"
    password = "Al8DV15Sx61CTrtu1Ehs"
    device_name = "shura"
    bitrate = 320
    volume_normalisation = true
    device_type = "speaker"
    '';
 
  programs = {
    mpv = {
      enable = true;
    };
  };
}
