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
  boot.blacklistedKernelModules = [
    "amd_sfh"
  ];

  boot.kernelParams = [
    "quiet"
    "amdgpu.aspm=0"
    "udev.log_level=3"
    "amdgpu.dcdebugmask=0x10"
    "i2c_hid.polling_interval=0" 
    "psmouse.synaptics_intertouch=1"
  ];

  systemd.services.NetworkManager-wait-online.enable = false;

  hardware.cpu.amd.updateMicrocode = true;
}
