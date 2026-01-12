{ pkgs, lib, config, ... }:

let
  marketplace = pkgs.vscode-utils.buildVscodeMarketplaceExtension;
in
{
  programs.vscode = {
    enable = true;

    mutableExtensionsDir = false;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # Aparência
        ms-ceintl.vscode-language-pack-pt-br

        # Nix
        bbenoist.nix
        jnoortheen.nix-ide

        # Web / TypeScript / React
        dbaeumer.vscode-eslint
        bradlc.vscode-tailwindcss
        formulahendry.auto-rename-tag
        mikestead.dotenv

        # Backend / DB
        prisma.prisma
        mongodb.mongodb-vscode

        # Qualidade de vida
        eamodio.gitlens
        usernamehw.errorlens
        tamasfe.even-better-toml
        yzhang.markdown-all-in-one
        naumovs.color-highlight

        # Ícones
        pkief.material-icon-theme
      ]
      ++ [
        (marketplace {
           mktplcRef = {
            name = "es7-react-js-snippets";
            publisher = "dsznajder";
            version = "4.4.3";
            sha256 = "sha256-QF950JhvVIathAygva3wwUOzBLjBm7HE3Sgcp7f20Pc=";
          };
        })
      ];
    };
  };

  home.file.".config/Code/User/settings.json".text = ''
    {
      "files.autoSave": "afterDelay",
      "files.autoSaveDelay": 1000,
      "files.trimTrailingWhitespace": true,
      "files.insertFinalNewline": true,

      "editor.tabSize": 2,
      "editor.insertSpaces": true,
      "editor.formatOnSave": true,
      "editor.formatOnPaste": true,
      "editor.codeActionsOnSave": {
        "source.fixAll.eslint": true
      },

      "editor.wordWrap": "on",
      "editor.minimap.enabled": false,
      "editor.renderWhitespace": "boundary",

      "editor.defaultFormatter": "esbenp.prettier-vscode",

      "[javascript]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
      },
      "[javascriptreact]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
      },
      "[typescript]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
      },
      "[typescriptreact]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
      },

      "eslint.validate": [
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact"
      ],

      "tailwindCSS.emmetCompletions": true,
      "tailwindCSS.validate": true,

      "prisma.formatOnSave": true,

      "git.enableSmartCommit": true,

      "workbench.startupEditor": "none",
      "workbench.iconTheme": "material-icon-theme",
      "workbench.settings.enableNaturalLanguageSearch": false,
      "workbench.settings.editor": "json",
      "workbench.settings.openDefaultSettings": false,
      "workbench.settings.useSplitJSON": false,

      "configurationSync.enable": false,
      "settingsSync.enabled": false,

      "update.mode": "none",
      "window.restoreWindows": "none",

      "extensions.autoUpdate": false,
      "extensions.autoCheckUpdates": false,

      "telemetry.telemetryLevel": "off"

      "locale": "pt-BR",
    }
  '';

  home.file.".config/Code/User/settings.json".source =
    lib.mkForce (
      config.lib.file.mkOutOfStoreSymlink
        "/etc/nixos/vscode/settings.json"
    );
}
