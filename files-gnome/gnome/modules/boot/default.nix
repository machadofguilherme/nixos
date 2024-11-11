{ config, pkgs, ... }: {
  # GRUB
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.enable = true;
  boot.loader.timeout = 3;

  # Atualiza microcode AMD
  hardware.cpu.amd.updateMicrocode = true;
}
