{ config, pkgs, ... }: {
  programs.git = {
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "${config.home.homeDirectory}/www";
    };
  };
}
