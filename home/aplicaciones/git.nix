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
      extraConfig = {
        # Para commits de archivos grandes. Ver https://stackoverflow.com/questions/2702731/git-fails-when-pushing-commit-to-github
        http = {
          postBuffer  = "500M";
          maxRequestBuffer = "100M";
        };
        core.compression = "0";

        # Para guardar credenciales en memoria por 1 hora
        credential.helper = "cache --timeout=3600";
      };
    };
  };
}
