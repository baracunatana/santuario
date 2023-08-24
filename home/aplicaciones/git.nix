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
    };
  };
}
