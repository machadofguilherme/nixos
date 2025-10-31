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
    ubuntu_font_family
    noto-fonts-cjk-sans
    nerd-fonts.fira-code
    noto-fonts-color-emoji
  ];
}
