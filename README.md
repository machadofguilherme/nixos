# NixOS Configuration - Guilherme

Este repositório contém minha configuração pessoal do NixOS utilizando **flakes**, **Home Manager**, **Plasma Manager**, **NUR** e outros recursos.

## 🧰 Estrutura

```
.
├── flake.nix                # Configuração principal do flake
├── flake.lock               # Lockfile com versões fixas
├── configuration.nix        # Entrada principal do sistema
└── home/
    └── home.nix             # Configuração do usuário (via Home Manager)
```

## 🚀 Como usar

1. **Clonar o repositório**:

   ```bash
   git clone git@github.com:machadofguilherme/nixos.git /etc/nixos
   ```

2. **Reaplicar a configuração**:

   ```bash
   sudo nixos-rebuild switch --flake /etc/nixos#hostname
   ```

3. **Atualizar os flake inputs**:

   ```bash
   nix flake update
   sudo nixos-rebuild switch --flake .#hostname
   ```

> Substitua `hostname` pelo nome da máquina configurado no `flake.nix`.

## 🔐 SSH com Keychain

Uso o [keychain](https://www.funtoo.org/Keychain) para carregar a chave SSH automaticamente:

```bash
keychain ~/.ssh/id_ed25519
source ~/.keychain/$HOST-sh
```

Isso garante que comandos `git` funcionem sem `sudo`.

## 🧠 Observações

* Configuração testada com `nixos-unstable`
* `home-manager` e `plasma-manager` são integrados via flake
* Atenção ao usar `programs.git.extraConfig` com `lib.mkForce` – evite strings diretas (em breve será removido)

---
