{ config, pkgs, ... }: {
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      timeout = 3;
    };
  };

  hardware.cpu.amd.updateMicrocode = true;
}
