{ config, pkgs, ... }: {
  home.file.".config/gtk-3.0/settings.ini" = {
    text = ''
      [Settings]
      gtk-theme-name=Breeze-Dark
      gtk-icon-theme-name=breeze-dark
      gtk-font-name=Noto Sans 10
      gtk-application-prefer-dark-theme=1
    '';
    force = true;
  };

  home.file.".config/gtk-4.0/settings.ini" = {
    text = ''
      [Settings]
      gtk-theme-name=Breeze-Dark
      gtk-icon-theme-name=breeze-dark
      gtk-font-name=Noto Sans 10
      gtk-application-prefer-dark-theme=1
    '';
    force = true;
  };

  home.file.".gtkrc-2.0" = {
    text = ''
      gtk-theme-name="Breeze-Dark"
      gtk-icon-theme-name="breeze-dark"
      gtk-font-name="Noto Sans 10"
    '';
    force = true;
  };
}
