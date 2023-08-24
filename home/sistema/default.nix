{ 
  config,
  pkgs,
  ... }:

{
  home.file = {
    ".config/wireplumer/bluetooth.lua.d".source = ./bluetooth.lua.d;
  };
}
