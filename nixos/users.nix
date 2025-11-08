{
  users.users = {
    neki = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
      packages = with pkgs; [];
    };
  };
}