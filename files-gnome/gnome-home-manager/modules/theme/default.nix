{ config, pkgs, ... }: {
  gtk = {
    enable = true;

    iconTheme = {
      name = "Colloid-Red-Dark";
    };

    theme = {
      name = "Nordic-darker";
      package = pkgs.nordic;
    };
  };

  programs.gnome-shell = {
    enable = true;

    extensions = [
      {
        id = "user-theme@gnome-shell-extensions.gcampax.github.com";
        package = pkgs.gnome-shell-extensions;
      }
    ];

    theme = {
      name = "Nordic-darker";
      package = pkgs.nordic;
    };
  };
}
