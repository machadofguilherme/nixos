{
  description = "Configura Prisma no NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs, ... }:
    let
      pkgs = import nixpkgs { inherit system; };
      system = "x86_64-linux";
    in

    {
      devShell.${system} = pkgs.mkShell {
        buildInputs = [
          pkgs.fish
          pkgs.nodejs
          pkgs.prisma
          pkgs.prisma-engines
        ];

        shellHook = ''
          echo "Iniciando ambiente com Prisma"
          sleep 3s
          export PRISMA_QUERY_ENGINE_LIBRARY=${pkgs.prisma-engines}/lib/libquery_engine.node
          export PRISMA_SCHEMA_ENGINE_BINARY=${pkgs.prisma-engines}/bin/schema-engine
          export PRISMA_QUERY_ENGINE_BINARY=${pkgs.prisma-engines}/bin/query-engine
          exec fish
        '';
      };
    };
}