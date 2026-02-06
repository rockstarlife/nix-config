{ config, pkgs, unstablePkgs, ... }:

{
  environment.systemPackages = with unstablePkgs; [
    google-chrome
    telegram-desktop
    yt-dlp
  ];
}
