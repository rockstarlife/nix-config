{ config, pkgs, ... }:

{
  boot.extraModulePackages = with config.boot.kernelPackages; [ broadcom_sta ];
  boot.blacklistedKernelModules = [ "b43" "b43legacy" "ssb" "bcma" "brcmfmac" "brcmsmac" "brcm80211" ];

  nixpkgs.config.permittedInsecurePackages = [
    "broadcom-sta-6.30.223.271-59-6.18.7"  # если ругается — подставь точное имя из ошибки
  ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  networking.networkmanager.enable = true;
}
