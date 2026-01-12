{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      # Nix (porque o editor vive dentro do sistema)
      bbenoist.nix
      jnoortheen.nix-ide

      # Web / TypeScript / React
      dbaeumer.vscode-eslint
      bradlc.vscode-tailwindcss
      dsznajder.es7-react-js-snippets
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

      # Ícones (opcional, mas funcional)
      pkief.material-icon-theme
    ];

    userSettings = {
      ## Arquivos
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay" = 1000;
      "files.trimTrailingWhitespace" = true;
      "files.insertFinalNewline" = true;

      ## Editor
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

      ## Formatter
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[javascriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };

      ## ESLint
      "eslint.validate" = [
        "javascript"
        "javascriptreact"
        "typescript"
        "typescriptreact"
      ];

      ## Tailwind
      "tailwindCSS.emmetCompletions" = true;
      "tailwindCSS.validate" = true;

      ## Prisma
      "prisma.formatOnSave" = true;

      ## Git
      "git.enableSmartCommit" = true;

      ## Aparência funcional
      "workbench.startupEditor" = "none";
      "workbench.iconTheme" = "material-icon-theme";
      "explorer.compactFolders" = false;
    };
  };
}
