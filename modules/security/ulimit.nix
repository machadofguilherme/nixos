{ config, pkgs, ... }: {
  # Ulimit
  security.pam.loginLimits = [{
    domain = "*";
    type = "-";
    item = "nofile";
    value = "1048576";
   }];
}
