{ config, pkgs, ... }:

{
  # CPU e iGPU
  services.auto-cpufreq = {
    enable = true;

    settings = {
      ac = {
        governor = "schedutil";
        turbo = "never";        
        # turbo = "auto";
      };

      battery = {
        governor = "powersave";
        turbo = "never";
      };
    };
  };

  # Evita conflito com outros daemons
  services.power-profiles-daemon.enable = false;

  # OOM
  services.earlyoom.enable = true;
  systemd.oomd.enable = true;
}
