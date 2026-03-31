#.modules/languages.nix
{ config, pkgs, unstablePkgs, ... }:

{

  # ────────────────────── stable ──────────────────────
  environment.systemPackages = with pkgs; [
    praat
  ]
  # ────────────────────── unstable ──────────────────────
  // (with unstablePkgs; [
    anki-bin
  ]);

}
