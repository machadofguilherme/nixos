{ config, pkgs, ... }: {
  # Fuso-horário
  time.timeZone = "America/Sao_Paulo";
  services.timesyncd.enable = true;
}
