#.modules/input-method.nix
{ config, pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";

    fcitx5 = {
      waylandFrontend = true;
      ignoreUserConfig = true;   # ← важно! игнорирует ~/.config/fcitx5

      addons = with pkgs; [
        fcitx5-gtk
        qt6Packages.fcitx5-chinese-addons
        # qt6Packages.fcitx5-configtool   # если нужен GUI
      ];

      # Декларативный порядок (us/ru + pinyin)
      settings = {
        inputMethod = {
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "pinyin";
          };
          "Groups/0/Items/0" = { Name = "keyboard-us"; };
          "Groups/0/Items/1" = { Name = "keyboard-ru"; };
          "Groups/0/Items/2" = { Name = "pinyin"; };
        };
      };
    };
  };

  # Переменные для River (Wayland)
  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
  };
}
