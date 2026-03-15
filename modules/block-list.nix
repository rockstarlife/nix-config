{ config, pkgs, unstablePkgs, ... }:

{
services.xserver = {
  enable = true;  # оставляем, потому что River/Wayland всё равно использует xkb оттуда

  excludePackages = with pkgs; [
    xterm          # ← вот это убирает xterm полностью
  ];
};

}
