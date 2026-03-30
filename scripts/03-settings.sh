#!/bin/bash
set -e

REPO_DIR="$(dirname "$(dirname "$(realpath "$0")")")"
DOTFILES_DIR="$REPO_DIR/dotfiles"

echo "  >> Cargando configuraciones de escritorio GNOME/Zorin (dconf)..."

if [ -s "$DOTFILES_DIR/dconf-settings.ini" ]; then
    dconf load / < "$DOTFILES_DIR/dconf-settings.ini"
    echo "  >> ¡Configuraciones dconf cargadas correctamente!"
else
    echo "  >> El archivo dconf-settings.ini no existe o está vacío. Saltando paso."
fi
