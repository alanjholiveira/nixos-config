SAVEHIST=1000  # Save most-recent 1000 lines
HISTFILE=~/.zsh_history
HISTSIZE=1000

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# SET SOURCE ZSH/SH/THEME
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/asdf-vm/asdf.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# EXPORT BIN PATH
export PATH=$PATH:$HOME/.local/bin

#export GOPATH=$(asdf where golang)/packages
#export GOROOT=$(asdf where golang)/go
#export PATH="${PATH}:$(go env GOPATH)/bin"
#source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
