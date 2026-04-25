{ config, pkgs, ... }: {
  # Ulimit
  security.pam.loginLimits = [{
    domain = "*";
    type = "-";
    item = "nofile";
    value = "65536";
   }];
}
