{ config, pkgs, ... }: {
  # Configurações do Nano
  programs.nano.nanorc = ''
    set nowrap
    set tabstospaces
    set tabsize 2
  '';
}
