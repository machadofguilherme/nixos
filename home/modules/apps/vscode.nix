{ pkgs, lib, config, ... }:

let
  marketplace = pkgs.vscode-utils.buildVscodeMarketplaceExtension;
in
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;

    profiles.default = {
      userSettings = {
        "files.autoSave" = "afterDelay";
        "files.autoSaveDelay" = 500;
        "files.trimTrailingWhitespace" = true;
        "files.insertFinalNewline" = true;
        "editor.tabSize" = 2;
        "editor.insertSpaces" = true;
        "editor.formatOnSave" = true;
        "editor.formatOnPaste" = true;
        "editor.codeActionsOnSave" = {
          "source.fixAll.eslint" = "explicit";
        };
        "editor.wordWrap" = "on";
        "editor.minimap.enabled" = false;
        "editor.renderWhitespace" = "boundary";
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[javascript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[javascriptreact]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[typescript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[typescriptreact]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "eslint.validate" = [
          "javascript"
          "javascriptreact"
          "typescript"
          "typescriptreact"
        ];
        "tailwindCSS.emmetCompletions" = true;
        "tailwindCSS.validate" = true;
        "prisma.formatOnSave" = true;
        "git.enableSmartCommit" = true;
        "workbench.startupEditor" = "none";
        "workbench.iconTheme" = "material-icon-theme";
        "settingsSync.enabled" = false;
        "update.mode" = "none";
        "extensions.autoUpdate" = false;
        "extensions.autoCheckUpdates" = false;
        "telemetry.telemetryLevel" = "off";
        "locale" = "pt-BR";
        "workbench.colorCustomizations" = null;
        "js/ts.updateImportsOnFileMove.enabled" = "always";
      };

      extensions = with pkgs.vscode-extensions; [
        ms-ceintl.vscode-language-pack-pt-br
        bbenoist.nix
        jnoortheen.nix-ide
        dbaeumer.vscode-eslint
        bradlc.vscode-tailwindcss
        formulahendry.auto-rename-tag
        mikestead.dotenv
        rust-lang.rust-analyzer
        prisma.prisma
        mongodb.mongodb-vscode
        eamodio.gitlens
        usernamehw.errorlens
        tamasfe.even-better-toml
        yzhang.markdown-all-in-one
        naumovs.color-highlight
        esbenp.prettier-vscode
        pkief.material-icon-theme
      ] ++ [
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
}
