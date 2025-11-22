{ pkgs, ... }:
{
  home.packages = [
    (pkgs.steam.override {
      extraPkgs = pkgs: [
        pkgs.gamescope
        pkgs.kdePackages.breeze # Fix for https://github.com/ValveSoftware/steam-for-linux/issues/12092
      ];

      extraEnv = {
        STEAM_RUNTIME = "1";
      };

    })

    pkgs.gamescope
    pkgs.goverlay
    pkgs.mangohud
    # pkgs.protontricks

  ];
}
