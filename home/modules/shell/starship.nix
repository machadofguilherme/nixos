{ config, pkgs, ... }: {
  # Starship
  programs = {
    starship = {
      enable = true;
      enableFishIntegration = true;
      enableInteractive = true;
      enableTransience = true;
      settings = {
        format = "[](#2E7D32)$os$username[](bg:#4CAF50 fg:#2E7D32)$directory[](fg:#4CAF50 bg:#8BC34A)$git_branch$git_status[](fg:#8BC34A bg:#A2D149)$c$elixir$elm$golang$gradle$haskell$java$julia$nodejs$nim$rust$scala[](fg:#A2D149 bg:#06969A)$docker_context[](fg:#06969A bg:#33658A)$time[ ](fg:#33658A)";

        username = {
          show_always = true;
          style_user = "bg:#2E7D32";
          style_root = "bg:#2E7D32";
          format = "[$user ]($style)";
        };

        directory = {
          style = "bg:#4CAF50";
          format = "[ $path ]($style)";
          truncation_length = 3;
          truncation_symbol = "…/";
        };

        git_branch = {
          symbol = "";
          style = "bg:#8BC34A";
          format = "[ $symbol $branch ]($style)";
        };

        git_status = {
          style = "bg:#8BC34A";
          format = "[$all_status$ahead_behind ]($style)";
        };

        nodejs = { style = "bg:#A2D149"; };
        rust = { style = "bg:#A2D149"; };
        golang = { style = "bg:#A2D149"; };
      
        time = {
          disabled = false;
          style = "bg:#33658A";
          format = "[ ♥ $time ]($style)";
        };
     };
    };
  };
}
