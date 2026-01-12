{ pkgs, lib, config, ... }:

let
  marketplace = pkgs.vscode-utils.buildVscodeMarketplaceExtension;
in
{
  programs.vscode = {
    enable = true;

    # evita o VSCode tentar escrever/extensões dinamicamente
    mutableExtensionsDir = false;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # Idioma
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

  home.file.".config/Code/User/settings.json".source =
    lib.mkForce (
      config.lib.file.mkOutOfStoreSymlink
        "/etc/nixos/vscode/settings.json"
    );
}
