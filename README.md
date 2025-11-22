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

## TODO
- [ ] Secure Boot [refs: [Secure-Boot](https://github.com/linux-surface/linux-surface/wiki/Secure-Boot)]
- [ ] Check Surface Control Utility [refs: [Utilities-and-Packages#surface-control-utility](https://github.com/linux-surface/linux-surface/wiki/Utilities-and-Packages#surface-control-utility)]
- [ ] Surface Pen & Touch [refs: [SP4 Touch Guide](https://github.com/linux-surface/linux-surface/wiki/Surface-Pro-4#how-to-get-touch-working-properly-on-surface-pro-4-the-definitive-guide)]
- [ ] IPTS deamon prevent shutdown by kernel panic
- [ ] Fix Bluetooth
- [ ] Test Webcam [refs: [Camera-Support](https://github.com/linux-surface/linux-surface/wiki/Camera-Support)]
- [ ] Check if Marvell PCIe affects us [refs: [Marvell-88W8897-quirks](https://github.com/linux-surface/linux-surface/wiki/Marvell-88W8897-quirks)]
- [ ] Extra check on thermald [refs: [Thermald-setup-and-configuration](https://github.com/linux-surface/linux-surface/wiki/Thermald-setup-and-configuration)]
- [ ] On-screen Keyboard in detached mode
- [ ] Test headphones
- [ ] Check for this known lid bug [refs: [suspend-aka-sleep-vs-lid-closingopening-events](https://github.com/linux-surface/linux-surface/wiki/Known-Issues-and-FAQ#suspend-aka-sleep-vs-lid-closingopening-events)]
- [ ] Install flatpak and appimage to avoid having to deal with Nix for everything :)
- [ ] Make a separate gaming module
- [ ] Try to fix flickergate with some hack
- [ ] Check post-installation [refs: [post-installation](https://github.com/linux-surface/linux-surface/wiki/Installation-and-Setup#post-installation)]
