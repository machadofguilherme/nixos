
{ inputs, pkgs, ... }: {
  #boot.kernelPackages = pkgs.linuxPackagesFor inputs.nix-cachyos-kernel.packages.${pkgs.system}.linux-cachyos-bore;
  boot.kernelPackages = pkgs.linuxPackages_cachyos_bore;

  boot.kernelParams = [
    "ipv6.disable=1"
    "amd_pstate=active"
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
