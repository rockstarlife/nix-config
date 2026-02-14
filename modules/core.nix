{ config, pkgs, ... }:

{
# ────────────────────── kernel ──────────────────────
  # boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest; # может быть более быстрым.
# ────────────────────── ZRAM ──────────────────────
  zramSwap.enable = true;
  zramSwap.memoryPercent = 50;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
    trusted-users = [ "root" "neo" ];
  };

  # nixpkgs.config.allowUnfree = true; # все таки нужен. для wifi driver.
  documentation.enable = false;
  system.stateVersion = "25.11";

# ────────────────────── sddm ──────────────────────
services.xserver.enable = true;
services.displayManager.sddm.enable = true;
services.displayManager.sddm.wayland.enable = true;

# ────────────────────── user ──────────────────────
  users.users.neo = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "input" "networkmanager"];
  };
 
# ────────────────────── fish shell──────────────────────
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

# ────────────────────── doas ──────────────────────
  security.doas.enable = true;
  security.doas.extraRules = [{
    users = [ "neo" ];
    keepEnv = true;
    persist = true;
    # as = "neo";  # это заставит doas работать от имени neo, а не root
  }];

# ────────────────────── pkgs ──────────────────────
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    fastfetch
    btop
    neovim
    tree
    jq
    home-manager
  ];

# ────────────────────── boot ──────────────────────
boot.loader = {
  grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    efiInstallAsRemovable = true;       # ← важно для Mac, ставит в EFI/BOOT/BOOTX64.EFI
    useOSProber = false;
    configurationLimit = 10;
  };

  efi = {
    canTouchEfiVariables = false;
    efiSysMountPoint = "/boot";
  };
};


# imperative way!!!!
# system.activationScripts.copyGrubToAppleBoot = ''
#   cp -f /boot/EFI/NixOS-boot/grubx64.efi /boot/System/Library/CoreServices/boot.efi || true
#   echo "Copied GRUB to Apple boot.efi"
# '';

}
