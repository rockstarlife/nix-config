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
      "https://cache.garnix.io"
    ];
    trusted-public-keys = [
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };

nixpkgs.config.allowUnfree = true;
  # 3. Выбираем ядро
# boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-bore-lto;
# boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-lts-lto;
}
