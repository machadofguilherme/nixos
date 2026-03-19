{ lib, ... }: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
      "steam-original"
      "steam-run"
      "proton-ge-bin"
      "vivaldi"
      "vivaldi-ffmpeg-codecs"
      "cloudflare-warp"
      "corefonts"
      "ngrok"
      "vscode"
      "postman"
      "spotify"
      "discord-development"
      "unrar"
    ];
}
