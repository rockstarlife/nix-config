{ config, pkgs, ... }:

{
# ────────────────────── wifi driver for macbook air ──────────────────────
  boot.extraModulePackages = with config.boot.kernelPackages; [ broadcom_sta ];
  boot.blacklistedKernelModules = [ "b43" "b43legacy" "ssb" "bcma" "brcmfmac" "brcmsmac" "brcm80211" ];

  nixpkgs.config.permittedInsecurePackages = [
    "broadcom-sta-6.30.223.271-59-6.18.7"  # если ругается — подставь точное имя из ошибки broadcom-sta-6.30.223.271-59-6.18.8
  ]; # for skip "NIXPKGS_ALLOW_INSECURE=1"
# sudo NIXPKGS_ALLOW_INSECURE=1 nixos-rebuild switch --flake /etc/nixos/nix-config#nixmac --impure


# ────────────────────── bluetooth ──────────────────────
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

# ────────────────────── networkmanager ──────────────────────
  networking.networkmanager.enable = true;
}
