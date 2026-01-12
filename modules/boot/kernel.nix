{ pkgs, ... }: {
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernel.sysctl = {
    "vm.swappiness" = 180;
  };
}
