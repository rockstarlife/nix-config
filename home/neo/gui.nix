{ config, pkgs, unstablePkgs, ... }:

{
  home.packages = with unstablePkgs; [
    google-chrome
    telegram-desktop
    yt-dlp
  ] ++ (with pkgs; [
    foot             # терминал
    mpv
    imv              # просмотр картинок
    grim             # скриншоты Wayland
    slurp            # выбор области
    wl-clipboard     # буфер обмена Wayland
    pamixer
    playerctl
    brightnessctl
  ]);

  programs.foot.enable = true;
  # Можно потом добавить foot.ini через home.file
}
