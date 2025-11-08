{
  description = "NixOS config for my Surface Pro 4";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    hardware.url = "github:NixOS/nixos-hardware/master";

    disko = {
      url = "github:nix-community/disko/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home manager
    # home-manager.url = "github:nix-community/home-manager/release-23.11";
    # home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    # home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      senkai-nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./hosts/senkai-nixos/configuration.nix];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    # homeConfigurations = {
    #   # FIXME replace with your username@hostname
    #   "your-username@your-hostname" = home-manager.lib.homeManagerConfiguration {
    #     pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
    #     extraSpecialArgs = {inherit inputs outputs;};
    #     # > Our main home-manager configuration file <
    #     modules = [./home-manager/home.nix];
    #   };
    # };
  };
}
