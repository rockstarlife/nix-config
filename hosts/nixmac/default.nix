
{ config, pkgs, unstablePkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core.nix
    ../../modules/hardware.nix
    ../../modules/fonts.nix
    ../../modules/river.nix
    ../../modules/unstable.nix
  ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixmac";
  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "25.11";
}
