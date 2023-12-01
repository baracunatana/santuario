{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./correo.nix
    ./edicion-texto.nix
    ./git.nix
    ./juegos.nix
    ./media.nix
    ./navegadores.nix
    ./syncthing.nix
    ./terminal.nix
    ./utilidades.nix
  ];
}
