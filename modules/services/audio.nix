{ config, pkgs, ... }: {
  # Áudio
  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;
}
