{ config, pkgs, ... }:

{
# ────────────────────── pkgs ──────────────────────
  environment.systemPackages = with pkgs; [
  inkscape
  ];
}
