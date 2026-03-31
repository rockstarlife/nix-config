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


# programs.anki.enable = true;
# catppuccin.anki.enable = true;
}
