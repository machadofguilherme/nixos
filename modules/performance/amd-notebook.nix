{ config, pkgs, ... }:

{
  # CPU e iGPU
  services.auto-cpufreq = {
    enable = true;

    settings = {
      ac = {
        governor = "schedutil";
        turbo = "auto";
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

  # Limitar CPU
  systemd.services.cpu-limit = {
    description = "Limit CPU max frequency";
    wantedBy = [ "multi-user.target" ];
    after = [ "auto-cpufreq.service" ];
    
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };

    script = ''
      for cpu_freq in /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq; do
        if [ -f "$cpu_freq" ]; then
          echo "3000000" > "$cpu_freq"
        fi
      done
    '';
  };
}
