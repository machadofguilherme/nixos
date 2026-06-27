{ config, pkgs, ... }: {
  # Daemon padrão de perfis de energia
  services.power-profiles-daemon.enable = true;

  # OOM
  systemd.oomd.enable = true;
}
