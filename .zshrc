# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Paths and exports
source $SERVERCONFIG/exports
source $SERVERCONFIG/exports.local
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH

# Settings
source $SERVERCONFIG/term-config

# Antibody static loading
source $HOME/.zsh_plugins.sh
# To load (after including more plugins), run:
# antibody bundle < $SERVERCONFIG/zsh-plugins > $HOME/.zsh_plugins.sh

# Load completions
autoload -Uz compinit
if [[ -n $HOME/.zcompdump(#qN.mh+24) ]]; then
  compinit
  touch $HOME/.zcompdump
else
  compinit -C
fi

source $SERVERCONFIG/key_bindings
source $SERVERCONFIG/aliases
source $SERVERCONFIG/functions

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
