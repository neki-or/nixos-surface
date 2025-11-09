{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "neki-or";
        email = "somaschini.marco2@gmail.com";
      };

      core = {
        helper = "store";
        usehttppath = true;
      };
    }
  }
}