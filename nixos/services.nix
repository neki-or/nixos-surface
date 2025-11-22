{ pkgs, ... }:
{
  services = {
    # Audio
    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    # Touchpad
    libinput.enable = true;

  };

  # Copied from my desktop with "Fedora" and KDE
  /*
  systemd.services.bluetooth = let
    bluez = pkgs.bluez.outPath;

  in {
    enable = true;
    description = "Bluetooth service [defined in nix-surface flake]";

    serviceConfig = {
      Type = "dbus";
      BusName = "org.bluez";
      ExecStart = "${bluez}/libexec/bluetooth/bluetoothd";
      NotifyAccess = "main";
      CapabilityBoundingSet = [ "CAP_NET_ADMIN" "CAP_NET_BIND_SERVICE" ];
      LimitNPROC = 1;

      # Filesystem lockdown
      ProtectHome = true;
      ProtectSystem = "strict";
      PrivateTmp = true;
      ProtectKernelTunables = true;
      ProtectControlGroups = true;
      StateDirectory = "bluetooth";
      StateDirectoryMode = "0700";
      ConfigurationDirectory = "bluetooth";
      ConfigurationDirectoryMode = "0555";

      # Execute Mappings
      MemoryDenyWriteExecute = true;

      # Privilege escalation
      NoNewPrivileges = true;

      # Real-time
      RestrictRealtime = true;
    };

    wantedBy = [ "bluetooth.target" ];
    aliases = [ "dbus-org.bluez.service" ];
  };
  */

}
