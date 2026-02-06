{ config, pkgs, unstablePkgs, ... }:

{
  # Пакеты только для терминала
  home.packages = with pkgs; [
    neovim           # теперь nvim будет работать
    git
    curl
    wget
    btop
    fastfetch
    yazi             # файловый менеджер в терминале
    cava
    tree             # визуализация музыки
  ];

  programs.fish.enable = true;

  programs.starship = {
    enable = true;
    # можно потом добавить кастомный prompt, если хочешь
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;  # $EDITOR = nvim
    viAlias = true;
    vimAlias = true;
    # плагины добавишь потом
  };

}
