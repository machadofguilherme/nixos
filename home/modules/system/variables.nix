{ config, pkgs, ... }: {
  # Variáveis de Sessão (Editor padrão)
  home.sessionVariables = {
    EDITOR = "nano";
  };
}
