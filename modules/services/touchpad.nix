{ config, pkgs, ... }: {
  services.libinput = {
    enable = true;

    touchpad = {
      tapping = true;
      disableWhileTyping = false;
      naturalScrolling = true;
    };
  };
}
