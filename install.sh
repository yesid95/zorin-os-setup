#!/bin/bash
set -e

REPO_DIR="$(dirname "$(realpath "$0")")"

echo "========================================="
echo "  Instalador de Configuración Zorin OS   "
echo "========================================="

# Dar permisos de ejecución a todos los scripts
chmod +x "$REPO_DIR/backup.sh" || true
chmod +x "$REPO_DIR/scripts/"*.sh || true

echo "--> Paso 1: Instalando Paquetes..."
"$REPO_DIR/scripts/01-packages.sh"

echo "--> Paso 2: Restaurando Dotfiles..."
"$REPO_DIR/scripts/02-dotfiles.sh"

echo "--> Paso 3: Restaurando Configuraciones Globales (dconf)..."
"$REPO_DIR/scripts/03-settings.sh"

echo "========================================="
echo "✅ Instalación completada exitosamente."
echo "NOTA: Algunas configuraciones visuales (como fuentes, barra de tareas, atajos de teclado) y variables de entorno pueden requerir que cierres sesión e inicies de nuevo para aplicarse por completo."
