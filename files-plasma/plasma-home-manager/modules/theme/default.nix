{ config, pkgs, ... }: {
  programs.plasma = {
    enable = true;
    workspace = {
      colorScheme = "Nordic-Darker";
      theme       = "Nordic-darker";
      iconTheme   = "Colloid-Green-Dark";
    };
  };
}
