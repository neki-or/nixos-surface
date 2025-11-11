{
  services = {
    # KDE Plasma 6
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;

    # Audio
    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    # Touchpad
    libinput.enable = true;

  };
}