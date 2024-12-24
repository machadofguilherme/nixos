{ config, pkgs, ... }: {
  # Aplicações
  environment.systemPackages = with pkgs; [
    (config._module.args.zen-browser.packages.${config._module.args.system})
    gnome-text-editor
    keychain
    openssl
    ptyxis
    loupe
  ];
}
