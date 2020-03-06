# Only sources for login shell (not vscode).
# After .zshenv, before .zshrc

# Load byobu (-u for unicode)
_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true
