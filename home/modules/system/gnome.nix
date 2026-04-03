#
#   Para obter o sha256 use:
#     nix-prefetch-github <nome-do-usuário> <nome-do-repositório>
#

{ lib, pkgs, ... }: 

let
  warpToggle = pkgs.stdenv.mkDerivation {
    pname = "warp-toggle-gnome-extension";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "mrvladus";
      repo = "warp-toggle-gnome-extension";
      rev = "main";
      sha256 = "sha256-tFaozFW0Yf3gNzjzOTJ2S6BYPYmZ/bvNFTM2k/ZAD/g=";
    };

    installPhase = ''
      mkdir -p $out/share/gnome-shell/extensions/warptoggle@mrvladus.github.io
      cp -r * $out/share/gnome-shell/extensions/warptoggle@mrvladus.github.io/
    '';
  };
in
{
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = lib.mkForce [
        "appindicatorsupport@rgcjonas.gmail.com"
        "warptoggle@mrvladus.github.io"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Adwaita-dark";
      icon-theme = "Adwaita";
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      accent-color = "red";
      show-battery-percentage = true;
      clock-show-weekday = true;
      clock-show-date = true;
      clock-show-seconds = false;
      enable-animations = true;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-temperature = 3700;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "suspend";
      sleep-inactive-battery-timeout = 900;
    };

    "org/gnome/desktop/sound" = {
      allow-volume-above-100-percent = true;
    };

    "org/gnome/desktop/privacy" = {
      remove-old-temp-files = true;
      remove-old-trash-files = true;
      old-files-age = 14;
      remember-recent-files = false;
      report-technical-problems = false;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      natural-scroll = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = [ ];
      switch-applications-backward = [ ];
      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab" ];
    };
  };

  home.packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.appindicator
    warpToggle
  ];
}
