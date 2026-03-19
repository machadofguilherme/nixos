{ config, pkgs, ... }:

{
  # CPU e iGPU
  services.auto-cpufreq = {
    enable = true;

    settings = {
      ac = {
        governor = "powersave";
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

  # GPU Normal
  systemd.services.gpu-power-normal = {
    description = "Set GPU to balanced/auto mode";
    wantedBy = [ "multi-user.target" ];
    after = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
    };

    script = ''
      GPU_PATH="/sys/class/drm/card1/device"

      if [ -d "$GPU_PATH" ]; then
        if [ -f "$GPU_PATH/power_dpm_force_performance_level" ]; then
          echo "auto" > "$GPU_PATH/power_dpm_force_performance_level" || true
        fi

        if [ -f "$GPU_PATH/power_dpm_state" ]; then
          echo "balanced" > "$GPU_PATH/power_dpm_state" || true
        fi
      fi
    '';
  };

  # GPU Jogos
  systemd.services.gpu-power-gaming = {
    description = "Set GPU to high performance mode";

    serviceConfig = {
      Type = "oneshot";
    };

    script = ''
      GPU_PATH="/sys/class/drm/card1/device"

      if [ -d "$GPU_PATH" ]; then
        if [ -f "$GPU_PATH/power_dpm_force_performance_level" ]; then
          echo "high" > "$GPU_PATH/power_dpm_force_performance_level" || true
        fi
      fi
    '';
  };
}
