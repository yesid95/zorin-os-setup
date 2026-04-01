#!/bin/bash
# Script de respaldo de configuraciones de sistema (GNOME/Dconf)

REPO_DIR="$(dirname "$(dirname "$(realpath "$0")")")"
DOTFILES_DIR="$REPO_DIR/dotfiles"
BACKUP_FILE="$DOTFILES_DIR/dconf-settings.ini"

echo ">> Iniciando respaldo de configuración dconf en: $BACKUP_FILE..."

# Realizamos un volcado de toda la base de datos de dconf (GNOME Settings)
if dconf dump / > "$BACKUP_FILE"; then
    echo "✅ Respaldo dconf completado exitosamente."
else
    echo "❌ Error al realizar el respaldo dconf."
    exit 1
fi

echo ">> No olvides hacer git commit y push para guardar los cambios en la nube."
