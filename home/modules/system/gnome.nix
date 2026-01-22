{ pkgs, ... }: {
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "cloudflare-warp-toggle@pavel.finkelshteyn.gmail.com"
        "just-perfection-desktop@just-perfection"
      ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      accent-color = "red";
    };
  };

  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.cloudflare-warp-toggle
    gnomeExtensions.just-perfection
  ];
}
