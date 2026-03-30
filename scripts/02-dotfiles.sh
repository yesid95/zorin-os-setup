#!/bin/bash
set -e

REPO_DIR="$(dirname "$(dirname "$(realpath "$0")")")"
DOTFILES_DIR="$REPO_DIR/dotfiles"

echo "  >> Copiando dotfiles a tu directorio personal..."

# bashrc
if [ -f "$DOTFILES_DIR/bashrc" ]; then
    echo "    - Restaurando ~/.bashrc (haciendo backup del anterior)"
    [ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
    cp "$DOTFILES_DIR/bashrc" ~/.bashrc
fi

# gitconfig
if [ -f "$DOTFILES_DIR/gitconfig" ]; then
    echo "    - Restaurando ~/.gitconfig"
    cp "$DOTFILES_DIR/gitconfig" ~/.gitconfig
fi

# .config/
if [ -d "$DOTFILES_DIR/config" ]; then
    echo "    - Restaurando carpetas dentro de ~/.config/"
    mkdir -p ~/.config
    # Copia todo el contenido recursivamente
    cp -r "$DOTFILES_DIR/config/"* ~/.config/
fi

echo "  >> ¡Dotfiles restaurados exitosamente!"
