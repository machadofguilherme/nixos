{ config, pkgs, lib, ... }:
{
  xdg.desktopEntries = {
    fish = { name = "fish"; noDisplay = true; };
    cups = { name = "Gerenciador de impressão"; noDisplay = true; };
    "org.freedesktop.IBus.Setup" = { name = "Preferências do IBus"; noDisplay = true; };
    # "org.kde.krdp" = { name = "KRdp"; noDisplay = true; };
    # "org.kde.kwalletmanager" = { name = "KWalletManager"; noDisplay = true; };
    # "org.kde.drkonqi.coredump.gui" = { name = "Visualizador de processos com falhas"; noDisplay = true; };
  };
}
