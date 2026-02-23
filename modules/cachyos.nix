{ config, pkgs, inputs, ... }:  # inputs здесь нужен, чтобы ссылаться на nix-cachyos-kernel

{
  # 1. Подключаем overlay из flake (pinned — для бинарного кэша, самый быстрый)
  nixpkgs.overlays = [
    inputs.nix-cachyos-kernel.overlays.pinned
  ];

  # 2. Добавляем кэш автора (чтобы не компилировать ядро на MacBook'e)
  nix.settings = {
    substituters = [
      "https://attic.xuyh0120.win/lantian"
    ];
    trusted-public-keys = [
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
    ];
  };

  # 3. Выбираем ядро
  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-bore-lto;
  # Альтернативы, если хочешь потестить (раскомментируй одну):
  # boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-bore-lto-x86_64-v3;  # свежее, но чаще ребуты
  # boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-bore-lto-x86_64-v3;         # latest без LTS

  # Опционально: если используешь ZFS — добавь это (но у тебя нет, так что пропусти)
  # boot.zfs.package = config.boot.kernelPackages.zfs_cachyos;
}
