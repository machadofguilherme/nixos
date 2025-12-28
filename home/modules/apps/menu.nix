{ config, pkgs, lib, ... }:
{
  xdg.desktopEntries = {
    fish = { name = "fish"; noDisplay = true; };
    cups = { name = "Gerenciador de impressão"; noDisplay = true; };
    "org.freedesktop.IBus.Setup" = { name = "Preferências do IBus"; noDisplay = true; };
    warp = { name = "Cloudflare Zero Trust"; noDisplay = true; };
  };
}
