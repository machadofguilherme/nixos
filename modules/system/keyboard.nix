{ config, pkgs, ... }: {
  services.xserver.xkb.layout = "br";
  console.keyMap = "br-abnt2";
}
