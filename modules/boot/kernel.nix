{ pkgs, ... }: {
  boot.kernelPackages = pkgs.linuxPackages;

  boot.kernelParams = [
    "ipv6.disable=1"
    "acpi_ec_timeout=500"
  ];

  boot.initrd.kernelModules = [
    "amdgpu"
  ];

  boot.kernel.sysctl = {
    "vm.swappiness" = 180;
     "net.core.default_qdisc" = "fq";
     "net.ipv4.tcp_congestion_control" = "bbr";
  };
}
