{
  pkgs,
  ...
}: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    commandLineArgs = [];
    extensions = []; # {id = "";}  // extension id, query from chrome web store
  };
}