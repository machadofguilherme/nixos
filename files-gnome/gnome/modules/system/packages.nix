{ config, pkgs, zen-browser, system, ... }: {
  # Permite Steam
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  # Aplicações
  environment.systemPackages = with pkgs; [
    zen-browser.packages."${system}".twilight
    gnome-text-editor
    keychain
    openssl
    ptyxis
    loupe
    nh
  ];
}
