{ config, pkgs, inputs, ... }: {
  # Steam
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  
  # Launcher para Genshin Impact
  home.packages = [
    inputs.twintail.packages.${pkgs.system}.default
  ];
}
