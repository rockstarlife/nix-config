{ config, pkgs, unstablePkgs, ... }:

{
  home.stateVersion = "25.11";

  imports = [
    ./cli.nix
    ./gui.nix
  ];
}
