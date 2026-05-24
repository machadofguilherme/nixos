{ config, pkgs, ... }: {
  services.libinput = {
    enable = true;

    touchpad = {
      tapping = true;
      disableWhileTyping = false;
      clickMethod = "buttonareas";
      naturalScrolling = true;
    };
  };

  environment.etc."libinput/local-overrides.quirks".text = ''
    [VAIO VJFE59 Touchpad]
    MatchName=PNP0C50:0b 093A:0255 Touchpad
    MatchBus=i2c
    AttrInputProp=-INPUT_PROP_BUTTONPAD
  '';
}
