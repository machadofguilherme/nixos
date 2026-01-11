{ config, pkgs, lib, ... }:
{
  xdg.configFile."autostart/warp.desktop".text = lib.mkForce "";
  xdg.configFile."autostart/cloudflare-warp.desktop".text = lib.mkForce "";

  xdg.desktopEntries = {
    btop = {
      name = "btop++";
      noDisplay = true;
      exec = "";
    };
    
    "auto-cpufreq-gtk" = {
      name = "auto-cpufreq";
      noDisplay = true;
      exec = "";
    };

    fish = { 
      name = "fish";
      noDisplay = true;
      exec = "";
    };

    cups = {
      name = "Gerenciador de impressão";
      noDisplay = true;
      exec = "";
    };

    "org.freedesktop.IBus.Setup" = {
      name = "Preferências do IBus";
      noDisplay = true;
      exec = "";
    };
  };
}
