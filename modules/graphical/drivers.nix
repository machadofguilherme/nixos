{ config, pkgs, ... }: {
  # Aceleração Gráfica
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
