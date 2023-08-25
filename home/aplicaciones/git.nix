{
  config,
  pkgs,
  ... }:

{
  programs = {
    git = {
      enable = true;
      userName = "Juan E. Gómez-Morantes";
      userEmail = "juanerasmoe@gmail.com";
      # Para commits de archivos grandes. Ver https://stackoverflow.com/questions/2702731/git-fails-when-pushing-commit-to-github
      extraConfig = {
        http = {
          postBuffer  = "524288000";
        };
      };
    };
  };
}
