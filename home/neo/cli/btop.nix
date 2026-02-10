{ config, lib, root, ... }:   # ← root теперь доступен здесь
{
  programs.btop = {
    enable = true;
    settings = builtins.fromTOML (builtins.readFile "${root}/dotfiles/btop/btop.conf");
  };

  home.file.".config/btop/themes".source = config.lib.file.mkOutOfStoreSymlink "${root}/dotfiles/btop/themes";
}
