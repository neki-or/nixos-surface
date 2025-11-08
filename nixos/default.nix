{
  boot = import ./boot.nix;
  locale = import ./locale.nix;
  nix = import ./nix.nix;
  networking = import ./networking.nix;
  services = import ./services.nix;
  users = import ./users.nix;
}