{
  pkgs,
  ...
}: {
  users.users = {
    neki = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
      packages = with pkgs; [];
    };

    gianni = {
      isNormalUser = true;
      extraGroups = [];
      packages = with pkgs; [];
    };

  };
}
