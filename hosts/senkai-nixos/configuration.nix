{ config, lib, pkgs, ... }:
{
  imports =
    [
      "${builtins.fetchTarball "https://github.com/NixOS/nixos-hardware/archive/7467f155fcba189eb088a7601f44fbef7688669b.tar.gz"}/microsoft/surface/surface-pro-intel"
      ./hardware-configuration.nix
      # Pin revision to a commit as the latest release is 100+ commits behind master
      "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/6f4cf5abbe318e4cd1e879506f6eeafd83f7b998.tar.gz"}/module.nix"
      ./disko-config.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.grub.device = "nodev";

  hardware.microsoft-surface.kernelVersion = "stable";

  networking.hostName = "senkai-nixos";
  networking.networkmanager.enable = true;

  nix.settings.build-dir = "/var/tmp";

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  time.timeZone = "Europe/Rome";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "it";
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support
  services.libinput.enable = true;

  users.users.neki = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      git
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
  ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  system.stateVersion = "25.05"; # Do not change

}
