#!/bin/bash
set -e

# Directorios de destino
REPO_DIR="$(dirname "$(realpath "$0")")"
PACKAGES_DIR="$REPO_DIR/packages"
DOTFILES_DIR="$REPO_DIR/dotfiles"

echo "Iniciando respaldo de configuración de Zorin OS..."
mkdir -p "$PACKAGES_DIR" "$DOTFILES_DIR/config"

# 1. Respaldar lista de paquetes (APT)
echo "1. Guardando paquetes instalados manualmente con APT..."
apt-mark showmanual > "$PACKAGES_DIR/apt.txt" || true

# 2. Respaldar lista de Flatpak
if command -v flatpak &> /dev/null; then
    echo "2. Guardando paquetes de Flatpak..."
    flatpak list --app --columns=application > "$PACKAGES_DIR/flatpak.txt" || true
else
    echo "No se encontró Flatpak, saltando..."
fi

# 3. Respaldar lista de Snap
if command -v snap &> /dev/null; then
    echo "3. Guardando paquetes de Snap..."
    # Omite el encabezado y guarda solo el nombre
    snap list | awk 'NR>1 {print $1}' > "$PACKAGES_DIR/snap.txt" || true
else
    echo "No se encontró Snap, saltando..."
fi

# 4. Respaldar dconf (Configuraciones de GNOME/Zorin)
echo "4. Guardando configuraciones del escritorio virtual de Zorin (dconf)..."
dconf dump / > "$DOTFILES_DIR/dconf-settings.ini" || true

# 5. Respaldar dotfiles
echo "5. Guardando dotfiles y configuraciones..."
if [ -f ~/.bashrc ]; then
    cp ~/.bashrc "$DOTFILES_DIR/bashrc"
fi
if [ -f ~/.gitconfig ]; then
    cp ~/.gitconfig "$DOTFILES_DIR/gitconfig"
fi

# Respaldar configuraciones comunes de .config si existen
# Puedes agregar mas carpetas de tu ~/.config/ a este listado
# Configuraciones específicas de VS Code para evitar copiar workspaceStorage
for conf_file in "Code/User/settings.json" "Code/User/keybindings.json" "Code/User/snippets"; do
    if [ -e "$HOME/.config/$conf_file" ]; then
        mkdir -p "$DOTFILES_DIR/config/$(dirname "$conf_file")"
        cp -r "$HOME/.config/$conf_file" "$DOTFILES_DIR/config/$(dirname "$conf_file")/"
    fi
done

for conf in "htop" "terminator" "vlc" "obs-studio"; do
    if [ -e "$HOME/.config/$conf" ]; then
        mkdir -p "$DOTFILES_DIR/config/$(dirname "$conf")"
        cp -r "$HOME/.config/$conf" "$DOTFILES_DIR/config/$(dirname "$conf")/"
    fi
done

# Extensiones de VS Code
if command -v code &> /dev/null; then
    echo "6. Guardando lista de extensiones de VS Code..."
    code --list-extensions > "$PACKAGES_DIR/vscode-extensions.txt" || true
else
    echo "No se encontró VS Code, saltando extensiones..."
fi

echo " "
echo "✅ ¡Respaldo completado exitosamente en $REPO_DIR!"
echo "Puedes revisar los archivos y hacer commits/push a tu repositorio de GitHub."
