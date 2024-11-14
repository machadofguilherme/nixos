{ config, pkgs, ... }: {
  xdg.desktopEntries."fish" = {
    name = "fish";
    noDisplay = true;
  };

  xdg.desktopEntries."cups" = {
    name = "Gerenciador de impressão";
    noDisplay = true;
  };

  xdg.desktopEntries."org.freedesktop.IBus.Setup" = {
    name = "Preferências do IBus";
    noDisplay = true;
  };

  xdg.desktopEntries."org.kde.krdp" = {
    name = "KRdp";
    noDisplay = true;
  };

  xdg.desktopEntries."org.kde.kwalletmanager" = {
    name = "KWalletManager";
    noDisplay = true;
  };

  xdg.desktopEntries."org.kde.drkonqi.coredump.gui" = {
    name = "Visualizador de processos com falhas";
    noDisplay = true;
  };
}
