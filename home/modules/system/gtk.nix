{ pkgs, ... }:

let
  mactahoe = pkgs.callPackage  ../../pkgs/mactahoe.nix {};
in {
  gtk = {
    enable = true;

    theme = {
      name = "MacTahoe-Dark";
      package = mactahoe;
    };

    iconTheme = {
      name = "Tela-circle";
      package = pkgs.tela-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };

  home.file.".local/share/flatpak/overrides/global".text = ''
    [Context]
    filesystems=/nix/store:ro;xdg-config/gtk-3.0:ro;xdg-config/gtk-4.0:ro;

    [Environment]
    GTK_THEME=MacTahoe-Dark
    ICON_THEME=Tela-circle
    XCURSOR_THEME=Bibata-Modern-Classic
  '';
}
