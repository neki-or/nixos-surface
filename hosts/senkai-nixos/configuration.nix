{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # nix-hardware Surface specific modules using linux-surface patches
    inputs.hardware.nixosModules.microsoft-surface-pro-intel
    inputs.disko.nixosModules.disko

    # NixOS configuration modules
    ../../nixos

    ./disko-config.nix
    ./hardware-configuration.nix
  ];

  # Use patched kernel 6.15 for better webcam support (hopefully)
  hardware.microsoft-surface.kernelVersion = "stable";
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  console.keyMap = "it";

  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.05";
}
