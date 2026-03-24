{ config, pkgs, ... }: {
  boot.initrd = {
    systemd.enable = true;
    includeDefaultModules = false;

    availableKernelModules = [
      "nvme"
      "xhci_pci"
      "usb_storage"
      "sd_mod"
      "i8042"
      "atkbd"
    ];
  };

  boot.loader = {
    timeout = 3;

    systemd-boot = {
      enable = true;
      configurationLimit = 3; 
    };

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  boot.consoleLogLevel = 0;
  boot.kernelParams = [ "quiet" "udev.log_level=3" ];

  # boot.kernelParams = [ "quiet" "udev.log_level=3" "clearcpuid=514" ];

  systemd.services.NetworkManager-wait-online.enable = false;

  hardware.cpu.amd.updateMicrocode = true;
}
