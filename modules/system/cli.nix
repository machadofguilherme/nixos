{ config, pkgs, ... }: {
  programs.nano.nanorc = ''
    set nowrap
    set tabstospaces
    set tabsize 2
  '';
}
