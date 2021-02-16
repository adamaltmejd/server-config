#!/usr/bin/env zsh
echo "Before running this, make sure ZSH and antibody is installed."
echo "Create symlinks in home folder (Y/N)"
read -k 1 REPLY; echo ''
if [[ $REPLY =~ ^[Yy]$ ]]; then

    echo "Location of server-config folder (added to .zshenv):"
    confloc="$(pwd)"
    vared confloc
    echo "export SERVERCONFIG=\"$confloc\"" >> $HOME/.zshenv

    echo "All files that would have been overwritten will be backed up to ~/dotfiles_backup/"
    for src in $(find -H `pwd -P` -maxdepth 1 -name '.*' -not -name '.gitignore' -not -name '.DS_Store' -not -name '.editorconfig' -not -path '*.git'); do
        dst="$HOME/$(basename "$src")"

        # If file exists move it to backup
        if [[ -f "$dst" || -d "$dst" || -L "$dst" ]]; then
            if [ ! -d ~/dotfiles_backup/ ]; then; mkdir ~/dotfiles_backup; fi
            mv "$dst" ~/dotfiles_backup
        fi

        # Create symbolic link
        echo "Linking $src to $dst"
        ln -s "$src" "$dst"
    done
    unset src dst

    # Local R directory
    if [ ! -d ~/.R/ ]; then; mkdir ~/.R; fi
    if [ ! -d ~/.R/packages ]; then; mkdir ~/.R/packages; fi
fi
echo "Done! Now run (in order):"
echo "antibody bundle < $SERVERCONFIG/zsh-plugins > $HOME/.zsh_plugins.sh"
echo "chsh -s $(which zsh)"
