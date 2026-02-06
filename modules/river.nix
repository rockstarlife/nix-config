{ config, pkgs, unstablePkgs, ... }:

{
  programs.river-classic.enable = true;

  environment.systemPackages = with pkgs; [
    river-classic
    swaybg
    wlr-randr
    foot
    grim
    slurp
    wl-clipboard
    pamixer
    playerctl
    brightnessctl
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
    qt6.qtwayland
  ];
}
