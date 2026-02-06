{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;

  zramSwap.enable = true;
  zramSwap.memoryPercent = 50;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
    trusted-users = [ "root" "neo" ];
  };

  nixpkgs.config.allowUnfree = true;

  users.users.neo = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "input" ];
  };

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  security.doas.enable = true;
  security.doas.extraRules = [{
    users = [ "neo" ];
    keepEnv = true;
    persist = true;
  }];

  environment.systemPackages = with pkgs; [
    git curl wget fastfetch btop
  ];

  documentation.nixos.enable = false;
  boot.loader = {
   efi = {
	canTouchEfiVariables = false;  # Mac EFI не любит, когда Nix трогает переменные
	efiSysMountPoint = "/boot"; # handline
   };

   grub = {
    enable = true;
    device = "nodev";                 # EFI-режим, не ставим в MBR
    efiSupport = true;
    useOSProber = false;              # was false не ищем другие ОС (Arch не нужен в меню NixOS)
    configurationLimit = 10;  # ← добавь это, чтобы не засорять EFI-партицию поколениями
    extraEntries = ''  #handline
	insmod part_gpt
	insmod fat
	insmod ext2
	# ...
	'';
  };
};
}
