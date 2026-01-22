{ pkgs, lib, ... }:

pkgs.stdenvNoCC.mkDerivation {
  pname = "mactahoe-gtk-theme";
  version = "unstable-2024";

  src = pkgs.fetchFromGitHub {
    owner = "vinceliuice";
    repo = "MacTahoe-gtk-theme";
    rev = "master";
    hash = "sha256-2SaUsr3XC8dB4tSrkp6mTar5zS+LbhkVV2gTd3VS4Co=";
  };

  installPhase = ''
    mkdir -p $out/share/themes
    cp -r themes/* $out/share/themes/
  '';
}
