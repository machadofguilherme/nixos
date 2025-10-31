{ config, pkgs, ... }: {
  # Fontes
  fonts.packages = with pkgs; [
    lato
    roboto
    open-sans
    work-sans
    dina-font
    corefonts
    noto-fonts
    roboto-mono
    proggyfonts
    ubuntu-classic
    noto-fonts-cjk-sans
    nerd-fonts.fira-code
    noto-fonts-color-emoji
  ];
}
