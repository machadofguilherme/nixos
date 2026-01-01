{ config, pkgs, ... }:

{
  powerManagement.cpuFreqGovernor = "schedutil";

  boot.kernelParams = [
    "amd_pstate=active"
    "threadirqs"
  ];

  services.auto-cpufreq.enable = true;

  zramSwap = {
    enable = true;
    memoryPercent = 25;
    algorithm = "zstd";
  };

  boot.kernel.sysctl = {
    "vm.swappiness" = 15;
    "vm.vfs_cache_pressure" = 75;
    "vm.dirty_ratio" = 15;
    "vm.dirty_background_ratio" = 5;
  };

  services.udev.extraRules = ''
    ACTION=="add|change", KERNEL=="nvme*n*", ATTR{queue/scheduler}="kyber"
  '';

  services.earlyoom = {
    enable = true;
    freeMemThreshold = 5;
    freeSwapThreshold = 5;
  };

  services.systemd-oomd.enable = false;

  services.irqbalance.enable = true;
}
