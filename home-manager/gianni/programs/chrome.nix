{
  pkgs,
  ...
}: {
  programs.chromium = {
    enable = true;
    package = pkgs.google-chrome;
    commandLineArgs = [];
    extensions = []; # {id = "";}  // extension id, query from chrome web store
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

}