# Only sources for login shell. After .zshenv, before .zshrc
source $SERVERCONFIG/exports
source $SERVERCONFIG/exports.local

# automatically remove duplicates from these arrays
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH

# Load byobu (-u for unicode)
_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true
