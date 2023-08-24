{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./correo.nix
    ./edicion-texto.nix
    ./git.nix
    ./navegadores.nix
    ./media.nix
    ./syncthing.nix
    ./utilidades.nix
    ./terminal.nix
  ];
}
