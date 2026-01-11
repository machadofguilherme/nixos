{ config, pkgs, lib, ... }:
{
  xdg.configFile."autostart/warp.desktop".text = lib.mkForce "";
  xdg.configFile."autostart/cloudflare-warp.desktop".text = lib.mkForce "";

  xdg.desktopEntries = {
    fish = { name = "fish"; noDisplay = true; };
    cups = { name = "Gerenciador de impressão"; noDisplay = true; };
    "org.freedesktop.IBus.Setup" = { name = "Preferências do IBus"; noDisplay = true; };
    "auto-cpufreq" = { name = "auto-cpufreq"; noDisplay = true; };
    "btop++" = { name = "btop++"; noDisplay = true; };
  };
}
