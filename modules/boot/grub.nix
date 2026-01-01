{ config, pkgs, ... }: {
  boot.loader = {
    timeout = 3;

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
  };

  hardware.cpu.amd.updateMicrocode = true;
}
