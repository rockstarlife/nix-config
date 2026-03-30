#.modules/input-method.nix
{ config, pkgs, ... }:

{
  # ────────────────────── fcitx5 для Simplified Chinese (лингвистский подход) ──────────────────────
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";

    fcitx5 = {
      waylandFrontend = true;   # обязательно для River/Wayland
      # plasma6Support = true;  # раскомментируй, если Chrome/Anki сильно тормозят на Qt6

      addons = with pkgs; [
        fcitx5-gtk                # поддержка GTK (Chrome, Anki, Koodo и т.д.)
        fcitx5-chinese-addons     # Simplified Pinyin — самый быстрый и простой для SC
        # fcitx5-configtool       # GUI для настройки (раскомментируй если нужно)
      ];
    };
  };

  # Для WM (River) — запускаем XDG autostart (fcitx5 запускается автоматически)
  services.xserver.desktopManager.runXdgAutostartIfNone = true;
}
