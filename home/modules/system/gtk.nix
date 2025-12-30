{ pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk;
    };

    iconTheme = {
      name = "breeze-dark";
      package = pkgs.kdePackages.breeze-icons;
    };

    cursorTheme = {
      name = "Breeze";
      package = pkgs.kdePackages.breeze;
    };
  };
  
  home.file.".local/share/flatpak/overrides/global".text = ''
    [Context]
    filesystems=/nix/store:ro;xdg-config/gtk-3.0:ro;xdg-config/gtk-4.0:ro;
    
    [Environment]
    GTK_THEME=Breeze-Dark
    ICON_THEME=breeze-dark
    XCURSOR_THEME=Breeze
  '';
}
