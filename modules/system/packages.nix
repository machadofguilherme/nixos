{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gnome-tweaks
    papers
    showtime
    keychain
    vivaldi
    vivaldi-ffmpeg-codecs
    unrar
    nix-heuristic-gc
    #cloudflare-warp
    vulkan-tools
  ];
}
