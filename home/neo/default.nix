# ./home/neo/default.nix
{ config, pkgs, unstablePkgs, lib, inputs, nix-colors, ... }:

{
  # ← вот эти две строки обязательны для standalone
  home.username      = "neo";
  home.homeDirectory = "/home/neo";
  home.stateVersion = "25.11";

  imports = [
    nix-colors.homeManagerModules.default

    ./cli/btop.nix
    # ./cli/cava.nix
    ./gui/foot.nix
  ];
colorScheme = nix-colors.colorSchemes.catppuccin-mocha;

  # Если хочешь использовать unstable пакеты в home (например foot из unstable)
  # home.packages = [ unstablePkgs.foot ];

  # Или оставь foot из stable — он обычно не нужен из unstable
}
