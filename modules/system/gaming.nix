{ config, pkgs, inputs, ... }: {
  # Steam
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  
  # Launcher para Genshin Impact
  environment.systemPackages = [
    inputs.twintail.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
