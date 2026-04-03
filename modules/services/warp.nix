{ config, pkgs, ... }: {
  services.cloudflare-warp.enable = true;

  nixpkgs.config.packageOverrides = pkgs: {
    cloudflare-warp = pkgs.cloudflare-warp.overrideAttrs (oldAttrs: {
      postInstall = (oldAttrs.postInstall or "") + ''
        rm -rf $out/share/applications
        rm -rf $out/share/icons
        rm -rf $out/etc/xdg/autostart
      '';
    });
  };
}
