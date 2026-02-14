{ config, lib, root, ... }:

{
  programs.cava = {
    enable = true;

    # Основной конфиг — берём твой оригинальный config из dotfiles
    settings = builtins.fromTOML (builtins.readFile "${root}/dotfiles/cava/config");
  };

  # Симлинк на всю папку shaders (если они у тебя есть и нужны)
  home.file.".config/cava/shaders".source = config.lib.file.mkOutOfStoreSymlink "${root}/dotfiles/cava/shaders";

  # Симлинк на папку themes (если cava их использует отдельно)
  home.file.".config/cava/themes".source = config.lib.file.mkOutOfStoreSymlink "${root}/dotfiles/cava/themes";
}
