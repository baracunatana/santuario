{ 
  config,
  pkgs,
  pkgs-legacy,
  ... }:

{
  home.packages = with pkgs; [
    javaPackages.openjfx17
    davmail
    isync
    pkgs-legacy.mu
  ];

  # home.file.".mbsyncrc".source = ./src/.mbsyncrc;
}

