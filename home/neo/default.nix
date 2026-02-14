# ./home/neo/default.nix
{ config, pkgs, unstablePkgs, lib, ... }:

{
  # ← вот эти две строки обязательны для standalone
  home.username      = "neo";
  home.homeDirectory = "/home/neo";
  home.stateVersion = "25.11";

  imports = [
    ./cli/btop.nix
    # ./cli/cava.nix
    ./gui/foot.nix
  ];

  # Если хочешь использовать unstable пакеты в home (например foot из unstable)
  # home.packages = [ unstablePkgs.foot ];

  # Или оставь foot из stable — он обычно не нужен из unstable
}
