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

# Initialize Antidote and zsh plugins
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

# Renew environment variables continuously in tmux
if [ -n "$TMUX" ]; then
    function _renew_tmux_env_one {
        oneenv=$(tmux show-environment | grep "^$1")
        [[ ! -z $oneenv ]] && export $oneenv
    }
    function _renew_tmux_env {
        _renew_tmux_env_one SSH_AUTH_SOCK
        _renew_tmux_env_one SSH_CONNECTION
        _renew_tmux_env_one DISPLAY
        _renew_tmux_env_one TERM_PROGRAM
    }
    add-zsh-hook preexec _renew_tmux_env
fi

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
