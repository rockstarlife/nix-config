{ config, pkgs, unstablePkgs, ... }:

{
  environment.systemPackages = with unstablePkgs; [
    google-chrome
    # chromium
    ungoogled-chromium
    firefox
    telegram-desktop
    yt-dlp
    # notion-app-enhanced
  ];
}
