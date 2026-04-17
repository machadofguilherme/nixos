{ config, pkgs, ... }: {
  # Ulimit
  security.pam.loginLimits = [{
    domain = "*";
    type = "hard";
    item = "nofile";
    value = "1048576";
   }];
}
