{ config, pkgs, ... }: {
  services.cloudflare-warp.enable = true;

  nixpkgs.config.packageOverrides = pkgs: {
    cloudflare-warp = pkgs.cloudflare-warp.overrideAttrs (oldAttrs: {
      postInstall = (oldAttrs.postInstall or "") + ''
        # Remove os arquivos que incomodam o GNOME
        rm -rf $out/share/applications
        rm -rf $out/share/icons
        rm -rf $out/etc/xdg/autostart
      '';
    });
  };
}
