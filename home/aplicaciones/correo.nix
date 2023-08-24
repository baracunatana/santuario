{ 
  config,
  pkgs,
  ... }:

{
  home.packages = with pkgs; [
    javaPackages.openjfx17
    davmail
    isync
    mu
  ];

  home.file.".mbsyncrc".source = ./src/.mbsyncrc;
}

