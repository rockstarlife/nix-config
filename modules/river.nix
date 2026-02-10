{ config, pkgs, unstablePkgs, ... }:

{
  programs.river-classic.enable = true;

  environment.systemPackages = with pkgs; [
    river-classic
    swaybg
    wlr-randr
    wlrctl # for mouse move when start river
    wl-clipboard
    pamixer
    playerctl
    brightnessctl
    grim
    slurp
    catppuccin-cursors.mochaDark
    foot
  	starship
    eww
	  fuzzel
    # xdg-desktop-portal
    # xdg-desktop-portal-wlr
    # xdg-desktop-portal-gtk
    # qt6.qtwayland
	  nautilus
	  foliate
	  yazi
  	cava
	  libqalculate
	  tty-clock
	  imv
	  mpv
  ];
}
