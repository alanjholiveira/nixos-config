#!/usr/bin/env nix-shell 
#!nix-shell -i bash -p patchelf

# Caminho do arquivo
ZSHRC="$HOME/.zshrc"
P10K_ZSH="$HOME/.p10k.zsh"

# Verifica se o arquivo existe
if [ -f "$ZSHRC" ]; then
    echo "O arquivo $ZSHRC existe."
else
    echo "O arquivo $ZSHRC não existe."
    echo "Copiando o arquivo de "$CONFIG_PATH"/zshrc/.zshrc para $HOME/.zshrc"
    cp "$CONFIG_PATH"/zshrc/.zshrc $HOME/.zshrc
fi

# Verifica se o arquivo existe
if [ -f "$P10K_ZSH" ]; then
    echo "O arquivo $P10K_ZSH existe."
else
    echo "O arquivo $P10K_ZSH não existe."
    echo "Copiando o arquivo de "$CONFIG_PATH"/powerlevel10k/.p10k.zsh para $HOME/.p10k.zsh"
    cp "$CONFIG_PATH"/powerlevel10k/.p10k.zsh $HOME/.p10k.zsh
fi
