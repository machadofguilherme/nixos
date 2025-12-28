{ config, pkgs, ... }:

{
  ############################################################
  # WARP Cloudflare – total invisibilidade no GNOME
  ############################################################

  # Serviço systemd do usuário
  systemd.user.services."warp-svc" = {
    description = "Cloudflare WARP Service";
    after = [ "network.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.warp-cli}/bin/warp-cli connect";
      ExecStop  = "${pkgs.warp-cli}/bin/warp-cli disconnect";
      Restart   = "on-failure";
    };
  };

  # Variável de sessão para facilitar scripts ou aliases
  home.sessionVariables.WARP_CLI = "${pkgs.warp-cli}/bin/warp-cli";

  # Alias útil no Fish
  programs.fish.shellAliases.warp-connect    = "${pkgs.warp-cli}/bin/warp-cli connect";
  programs.fish.shellAliases.warp-disconnect = "${pkgs.warp-cli}/bin/warp-cli disconnect";
}
