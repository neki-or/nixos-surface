{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "neki-or";
        email = "somaschini.marco2@gmail.com"; # Witness my personal email, I couldn't care less
      };

      core = {
        helper = "store";
        usehttppath = true;
      };
    }
  }
}