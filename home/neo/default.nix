# ./home/neo/default.nix
{ config, pkgs, unstablePkgs, lib, inputs,  ... }:

{
  # ← вот эти две строки обязательны для standalone
  home.username      = "neo";
  home.homeDirectory = "/home/neo";
  home.stateVersion = "25.11";

  imports = [
    # ./cli/btop.nix
    # ./cli/cava.nix
    # ./gui/foot.nix
    # ./openclaw.nix
  ];

home.packages = with pkgs; [
  qt6.qtwayland          # основной пакет для Qt Wayland
  qt5.qtwayland          # на всякий случай (Telegram может тянуть Qt5)
  mesa                   # обязательно для EGL
  libglvnd
];

home.sessionVariables = {
  XDG_CURRENT_DESKTOP = "river";
  XDG_SESSION_TYPE = "wayland";
  QT_QPA_PLATFORM = "wayland";           # или "wayland-egl"
  QT_QPA_PLATFORMTHEME = "qt5ct";        # если используешь qt5ct
  # QT_QPA_PLATFORM = "wayland;xcb";     # fallback — попробуй потом
};

catppuccin = {
  enable = true;
  flavor = "latte";
  # flavor = "mocha";
  accent = "teal";  # или blue, green, rosewater — выбирай
};

programs.foot = {
  enable = true;

  settings = {
    main = {
      font = "JetBrainsMono Nerd Font:size=20";
      dpi-aware = "yes";  # для твоего MacBook Air — полезно
    };
  };
};
catppuccin.foot.enable = true;

programs.fish.enable = true;
catppuccin.fish.enable = true;

programs.starship = {
  enable = true;
  enableFishIntegration = true;  # ← это важно, автоматически добавит init в fish

  settings = {
    battery = {
      disabled = true;
    };
  };
};
catppuccin.starship.enable = true;

programs.btop.enable = true;
catppuccin.btop.enable = true;

programs.cava.enable = true;
catppuccin.cava.enable = true;

programs.yazi.enable = true;
catppuccin.yazi.enable = true;

programs.fuzzel.enable = true;
catppuccin.fuzzel.enable = true;
catppuccin.fuzzel.accent = "teal";


programs.imv.enable = true;
catppuccin.imv.enable = true;

# programs.anki.enable = true;
# catppuccin.anki.enable = true;
}
