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
    noto-fonts-emoji
    ubuntu_font_family
    noto-fonts-cjk-sans
    nerd-fonts.fira-code
  ];
}
