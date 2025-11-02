# nixos-surface

NixOS config for my Surface Pro 4

## Installation
1) Boot into NixOS 25.05 live environment

2) Clone this repository: 
```bash
git clone https://github.com/neki-or/nixos-surface.git /tmp/nixos-surface
```

3) Run disko to wipe the drive and create all needed partitions:
```bash
nix --experimental-features "nix-command flakes" run \
    github:nix-community/disko/6f4cf5abbe318e4cd1e879506f6eeafd83f7b998 -- \
    --mode destroy,format,mount \
    /tmp/nixos-surface/hosts/senkai-nixos/disko-config.nix

# Check using `lsblk` that the command behaved as expected
```

4) Setup NixOS configurations
```bash
nixos-generate-config --no-filesystems --root /mnt
cp /tmp/nixos-surface/hosts/senkai-nixos/disko-config.nix /mnt/etc/nixos
cp /tmp/nixos-surface/hosts/senkai-nixos/configuration.nix /mnt/etc/nixos
```

5) Install NixOS
```bash
nixos-install
```

6) `reboot`
