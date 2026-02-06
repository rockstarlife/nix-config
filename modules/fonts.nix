{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    inter # open source clone of San Francisco from Apple.
    nerd-fonts.jetbrains-mono
    noto-fonts # резервный самый глобальный шрифт, подходит для всего.
    catppuccin-cursors.mochaDark
  ];
}
