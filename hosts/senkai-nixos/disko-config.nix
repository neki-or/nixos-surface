{
  disko.devices = {
    disk = {
      nvme0n1 = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              label = "BOOT";
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "defaults" "umask=0077" ];
              };
            };

            root = {
              end = "-8G"; # Leave space for SWAP (no hibernation)
              content = {
                type = "btrfs";
                extraArgs = ["-L" "nixos" "-f"];
                subvolumes = {
                  "/root" = {
                    mountpoint = "/";
                  };
                  "/home" = {
                    mountpoint = "/home";
                    mountOptions = ["subvol=home" "compress=zstd" ];
                  };
                  "/nix" = {
                    mountpoint = "/nix";
                    mountOptions = ["subvol=nix" "compress=zstd" "noatime"];
                  };
                  "/log" = {
                    mountpoint = "/var/log";
                    mountOptions = ["subvol=log" "compress=zstd" "noatime"];
                  };
                };
              };
            };

            swap = {
              size = "100%";
              content = {
                type = "swap";
                extraArgs = ["-L" "swap" ];
                discardPolicy = "both";
              };
            };
          };
        };
      };
    };
  };

  fileSystems."/var/log".neededForBoot = true;
}
