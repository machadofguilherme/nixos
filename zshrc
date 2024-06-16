# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Usar keychain para gerenciar ssh-agent
eval $(keychain --quiet --eval --agents ssh id_ed25519) > /dev/null 2>&1
