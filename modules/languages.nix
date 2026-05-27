#.modules/languages.nix
{ config, pkgs, unstablePkgs, ... }:

{
  environment.systemPackages = with pkgs; [ 
  # praat
  ] ++ (with unstablePkgs; [ 
  anki-bin 
  ]);
}
