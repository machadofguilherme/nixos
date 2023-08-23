autoload -U promptinit; promptinit; 
autoload -U compinit bashcompinit
compinit
bashcompinit
zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true

autoload -U select-word-style
select-word-style bash

export PATH=$PATH:$HOME/.local/bin
export EDITOR="micro"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh)"
fi

# eval "$(oh-my-posh init zsh --config ~/.cache/oh-my-posh/themes/easy-term.omp.json)"

setopt auto_cd
setopt HIST_IGNORE_SPACE
setopt interactive_comments
setopt inc_append_history
setopt share_history
setopt AUTO_PUSHD          
setopt PUSHD_IGNORE_DUPS    
setopt PUSHD_SILENT 

alias docker-createdb="docker run -d -e MYSQL_ROOT_PASSWORD=password -e MYSQL_USER=root -e MYSQL_PASSWORD=password -v ~/Documentos/databse:/var/lib/mysql -p 3306:3306 --name books_api mysql:8.0.31-debian"
alias nix-config="sudo micro /etc/nixos/configuration.nix"
alias nix-rebuild="sudo nixos-rebuild --upgrade --fast -j 4 -k switch"
alias home-nix-config="micro $HOME/.config/nixpkgs/home.nix"
alias home-nix-rebuild="home-manager -j 4 --cores 4 switch"
# alias nix-update="sudo nix-channel --update && nix-rebuild"
alias nix-clean="sudo nix-collect-garbage -d && sudo nix-store --gc && sudo nixos-rebuild --fast -j 4 -k boot && sudo nix-store --optimise"

# Necessário para auto-complete do comando trybe-publisher
source /etc/bash_completion.d/trybe-publisher
