{ config, pkgs, ... }: {
  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_TIME = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
  };
}
