{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    keychain
    vivaldi
    vivaldi-ffmpeg-codecs
    unrar
    nix-heuristic-gc
    vulkan-tools
  ];
}
