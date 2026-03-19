{ pkgs }:

pkgs.writeShellScriptBin "twintail" ''
  set -e

  APP_ID="app.twintaillauncher.ttl"
  FLATPAK="${pkgs.flatpak}/bin/flatpak"

  if ! "$FLATPAK" info "$APP_ID" >/dev/null 2>&1; then
    echo "❌ Twintail não está instalado."
    echo "👉 Instale com:"
    echo "   flatpak install flathub $APP_ID"
    exit 1
  fi

  exec "$FLATPAK" run "$APP_ID"
''
