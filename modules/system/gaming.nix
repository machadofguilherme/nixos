{ config, pkgs, ... }: {
  # Steam
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  # Launcher Genshin Impact
  programs.anime-game-launcher.enable = true;
  programs.anime-games-launcher.enable = true;
}
