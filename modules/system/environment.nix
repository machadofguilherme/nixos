{ config, pkgs, ... }: {
  environment.etc."firefox/config.js".source =
    "${geckium}/Firefox Folder/config.js";

  environment.etc."firefox/defaults".source =
    "${geckium}/Firefox Folder/defaults";
}
