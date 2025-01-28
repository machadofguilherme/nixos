{ config, pkgs, zen-browser, system, ... }: {
  # Aplicações
  environment.systemPackages = with pkgs; [
    zen-browser.packages."${system}".twilight
    gnome-text-editor
    keychain
    openssl
    ptyxis
    loupe
  ];
}
