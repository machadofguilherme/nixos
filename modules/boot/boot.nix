{ config, pkgs, ... }: {
  boot.initrd = {
   systemd.enable = true;
   includeDefaultModules = false;
   availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" ];
  };

  boot.loader = {
    timeout = 3;

    systemd-boot = {
      enable = true;
      configurationLimit = 5; 
    };

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    grub.enable = false;
  };

  boot.consoleLogLevel = 0;
  boot.kernelParams = [ "quiet" "udev.log_level=3" "clearcpuid=514" ];

  systemd.services.NetworkManager-wait-online.enable = false;

  hardware.cpu.amd.updateMicrocode = true;
}
