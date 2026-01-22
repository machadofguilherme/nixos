{ pkgs, ... }: {
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      accent-color = "red";
      gtk-theme = "MacTahoe-Dark";
      icon-theme = "Tela-circle";
      cursor-theme = "Bibata-Modern-Classic";
    };
  };

  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.cloudflare-warp-toggle
    gnomeExtensions.just-perfection
  ];
}
