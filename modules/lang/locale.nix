{ config, pkgs, ... }: {
  # Internacionalização
  i18n.defaultLocale = "pt_BR.UTF-8";

  # Mapa de teclado
  services.xserver.xkb.layout = "br";
}
