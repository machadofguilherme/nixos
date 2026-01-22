{ pkgs, ... }: {
  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.kernelParams = [
    "ipv6.disable=1"
  ];

  boot.initrd.kernelModules = [
    "amdgpu"
  ];

  boot.kernel.sysctl = {
    "vm.swappiness" = 180;
  };
}
