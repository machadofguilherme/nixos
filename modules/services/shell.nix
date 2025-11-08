{ config, pkgs, ... }: {
  # Permite direnv
  programs.direnv.enable = true;

  # SSH
  programs.ssh.startAgent = true;
  programs.ssh.enableAskPassword = false;

  # Fish
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # Variáveis
  environment.variables = {
    ENABLE_VKBASALT = "1";
    VK_INSTANCE_LAYERS = "VK_LAYER_VKBASALT_post_processing";
    VKBASALT_LOG_LEVEL = "debug";
  };
}
