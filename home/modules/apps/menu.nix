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

    steam-deck-mode = {
      name = "Steam (Deck Mode)";
      comment = "Steam rodando via Gamescope com FSR e 40 FPS";
      icon = "steam";
      terminal = false;
      categories = [ "Game" ];

      exec = "gamemoderun gamescope -W 1920 -H 1080 -w 1280 -h 800 -r 40 -F fsr -- steam -gamepadui";
    };
  };
}
