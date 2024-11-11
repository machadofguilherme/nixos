{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    fira-code
    meslo-lgs-nf
    fira-code-symbols
  ];

  # Configuração das fontes padrão para emoji e monospace
  fonts.fontconfig.defaultFonts = {
    emoji = [ "Noto Color Emoji" ];
    monospace = [ "MesloLGS NF Bold" ];
  };
}
