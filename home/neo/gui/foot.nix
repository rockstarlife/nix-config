# .home/neo/gui/foot.nix 
{ config, pkgs, unstablePkgs, lib, inputs, nix-colors, ... }:

{
# через переменные.
# programs.foot = {
#     enable = true;
#
#     settings = {
#       main = {
#         font = "JetBrainsMono Nerd Font:size=20";
#         dpi-aware = "yes";          # ← добавили
#       };
#
#       colors = {
#         foreground = config.colorScheme.palette.base05;   # текст
#         background = config.colorScheme.palette.base00;   # фон
#
#         regular0  = config.colorScheme.palette.base00;    # black
#         regular1  = config.colorScheme.palette.base08;    # red
#         regular2  = config.colorScheme.palette.base0B;    # green
#         regular3  = config.colorScheme.palette.base0A;    # yellow
#         regular4  = config.colorScheme.palette.base0D;    # blue
#         regular5  = config.colorScheme.palette.base0E;    # magenta
#         regular6  = config.colorScheme.palette.base0C;    # cyan
#         regular7  = config.colorScheme.palette.base05;    # white
#
#         bright0   = config.colorScheme.palette.base03;    # bright black
#         bright1   = config.colorScheme.palette.base08;    # bright red
#         bright2   = config.colorScheme.palette.base0B;
#         bright3   = config.colorScheme.palette.base0A;
#         bright4   = config.colorScheme.palette.base0D;
#         bright5   = config.colorScheme.palette.base0E;
#         bright6   = config.colorScheme.palette.base0C;
#         bright7   = config.colorScheme.palette.base07;    # bright white (обычно светлее base05)
#
#         # дополнительные цвета из твоего старого конфига (catppuccin mocha)
#         "16"      = config.colorScheme.palette.base09;    # orange / peach
#         "17"      = config.colorScheme.palette.base0F;    # rosewater / pinkish
#
#         cursor                = "${config.colorScheme.palette.base0F} ${config.colorScheme.palette.base05}";
#         selection-foreground  = config.colorScheme.palette.base05;
#         selection-background  = config.colorScheme.palette.base02;  # чуть светлее base01, но можно base03
#
#         # search и jump-labels — можно оставить хардкод или подогнать под palette
#         "search-box-no-match" = "${config.colorScheme.palette.base00} ${config.colorScheme.palette.base08}";
#         "search-box-match"    = "${config.colorScheme.palette.base05} ${config.colorScheme.palette.base03}";
#         "jump-labels"         = "${config.colorScheme.palette.base00} ${config.colorScheme.palette.base09}";
#         urls                  = config.colorScheme.palette.base0D;  # blue
#       };
#     };
#   };


programs.foot = {
    enable = true;

    # Вариант А — самый чистый: копируем содержимое твоего foot.ini как текст
    # (рекомендую именно этот — полный контроль, легко править в Nix)
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=13";
      };

      colors = {
        cursor = "11111b f5e0dc";
        foreground = "cdd6f4";
        background = "1e1e2e";
        regular0 = "45475a";
        regular1 = "f38ba8";
        regular2 = "a6e3a1";
        regular3 = "f9e2af";
        regular4 = "89b4fa";
        regular5 = "f5c2e7";
        regular6 = "94e2d5";
        regular7 = "bac2de";
        bright0 = "585b70";
        bright1 = "f38ba8";
        bright2 = "a6e3a1";
        bright3 = "f9e2af";
        bright4 = "89b4fa";
        bright5 = "f5c2e7";
        bright6 = "94e2d5";
        bright7 = "a6adc8";
        "16" = "fab387";
        "17" = "f5e0dc";
        selection-foreground = "cdd6f4";
        selection-background = "414356";
        "search-box-no-match" = "11111b f38ba8";
        "search-box-match" = "cdd6f4 313244";
        "jump-labels" = "11111b fab387";
        urls = "89b4fa";
      };
    };
  };
}
