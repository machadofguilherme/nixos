{ config, pkgs, ... }:

{
  # CPU e iGPU
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery-profile = "powersave";      
    ac-profile = "balanced";             
    tune-thermal = true;                 
    governor-battery = "powersave";
    governor-ac = "powersave";           
    max-frequency-ac = "65%";        
  };

  # Evita conflito com outros daemons
  services.power-profiles-daemon.enable = false;

  # OOM
  services.earlyoom.enable = true;
  systemd.oomd.enable = true;
};
