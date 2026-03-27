{ config, pkgs, zen-browser, system, ... }: {
  programs.anime-game-launcher.enable = true;

  environment.systemPackages = with pkgs; [
    (auto-cpufreq.overrideAttrs (old: {
      postInstall = (old.postInstall or "") + ''
        rm -f $out/share/applications/auto-cpufreq.desktop
      '';
    }))

    unrar
    cachix
    keychain
    bubblewrap
    vulkan-tools
    nix-heuristic-gc
    zen-browser.packages."${stdenv.hostPlatform.system}".default
  ];
}
