{ pkgs, ... }:

let
  twintailWrapped = pkgs.writeShellScriptBin "twintail-wrapped" ''
    setsid ${pkgs.twintail}/bin/twintail &
    pid=$!
    wait $pid || true
    kill -TERM -$pid 2>/dev/null || true
  ''
in {
  home.packages = [
    twintailWrapped
  ];

  xdg.desktopEntries.twintail = {
    name = "TwintailLauncher";
    exec = "twintail-wrapped";
    icon = "app.twintaillauncher.ttl";
    terminal = false;
    categories = [ "Game" ];
  };
}
