{ config, pkgs, ... }: {
  # Permite touchpad
  services.libinput.enable = true;
  services.libinput.touchpad.tapping = true;
}
