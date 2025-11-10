{ pkgs, ... }:
{
  home.packages = [
    (pkgs.steam.override {extraPkgs = p: [p.gamescope];})
    pkgs.gamescope
    # pkgs.protontricks
  ];

  home.sessionVariables = {
    STEAM_RUNTIME = "1";
    # STEAM_FORCE_DESKTOPUI_SCALING = "1.25";
  };
}
