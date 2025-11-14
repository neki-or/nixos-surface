{ pkgs, ... }:
{
  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    desktopManager.plasma6.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kdePackages.kcalc
    kdePackages.plasma-wayland-protocols
    kdePackages.print-manager
    kdePackages.sddm-kcm
    kdePackages.wayland-protocols
    # kdePackages.wayland-utils
    # kdePackages.wl-clipboard
    kdePackages.xwaylandvideobridge
  ];

  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.kwalletmanager
    kdePackages.kwallet
  ];
}
