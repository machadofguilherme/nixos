{ config, pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      # UI / Texto
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      roboto
      open-sans
      work-sans
      ubuntu-classic

      # Código / Terminal
      roboto-mono
      nerd-fonts.fira-code
      dina-font
      proggyfonts

      # Compatibilidade
      corefonts
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "FiraCode Nerd Font" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
