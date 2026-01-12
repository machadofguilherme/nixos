{ pkgs, ... }:

let
  marketplace = pkgs.vscode-utils.buildVscodeMarketplaceExtension;
in
{
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
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

      userSettings = {
        "files.autoSave" = "afterDelay";
        "files.autoSaveDelay" = 1000;
        "files.trimTrailingWhitespace" = true;
        "files.insertFinalNewline" = true;

        "editor.tabSize" = 2;
        "editor.insertSpaces" = true;
        "editor.formatOnSave" = true;
        "editor.formatOnPaste" = true;
        "editor.codeActionsOnSave" = {
          "source.fixAll.eslint" = true;
        };

        "editor.wordWrap" = "on";
        "editor.minimap.enabled" = false;
        "editor.renderWhitespace" = "boundary";

        "editor.defaultFormatter" = "esbenp.prettier-vscode";

        "[javascript]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
        "[javascriptreact]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
        "[typescript]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
        "[typescriptreact]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };

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
        "explorer.compactFolders" = false;
      };
    };
  };
}
