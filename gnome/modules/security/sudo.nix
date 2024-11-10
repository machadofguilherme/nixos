{ config, pkgs, ... }: {
  # Sudo
  security.sudo.execWheelOnly = true;
  security.sudo.wheelNeedsPassword = false;
}
