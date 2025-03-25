{ 
  config,
  pkgs,
  pkgs-unstable,
  ... }:

{
  home.packages = with pkgs; [
    pinta
    spotify
    playerctl
    pkgs-unstable.spotifyd
  ];
   
  home.file.".config/spotifyd/spotifyd.conf".text =''
    [global]
    devicename = "shion"
    bitrate = 320
    volume_normalisation = true
    device_type = "speaker"
    '';

  services = {
    # Permite controlar reproductores de multimedia (como spotifyd) con MPRIS
    playerctld.enable = true;
    spotifyd = {
      enable = true;
      package = pkgs-unstable.spotifyd;
      settings = {
        global = {
          use_mpris = true;
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
