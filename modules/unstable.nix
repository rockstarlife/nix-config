{ config, pkgs, unstablePkgs, ... }:

{
  environment.systemPackages = with unstablePkgs; [
    google-chrome
    firefox
    telegram-desktop
    yt-dlp
    koodo-reader
    anki-bin
  ];
}
