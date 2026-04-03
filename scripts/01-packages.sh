#!/bin/bash
set -e

REPO_DIR="$(dirname "$(dirname "$(realpath "$0")")")"
PACKAGES_DIR="$REPO_DIR/packages"

# 1. Instalar paquetes de APT
if [ -s "$PACKAGES_DIR/apt.txt" ]; then
    echo "  >> Actualizando repositorios APT e instalando paquetes..."
    sudo apt update
    xargs -a "$PACKAGES_DIR/apt.txt" sudo apt install -y
else
    echo "  >> No hay lista de APT para instalar o está vacía."
fi

# 2. Instalar paquetes Flatpak
if [ -s "$PACKAGES_DIR/flatpak.txt" ]; then
    echo "  >> Instalando aplicaciones Flatpak..."
    if ! command -v flatpak &> /dev/null; then
        echo "Instalando flatpak primero..."
        sudo apt install -y flatpak
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    fi
    xargs -a "$PACKAGES_DIR/flatpak.txt" flatpak install -y flathub
else
    echo "  >> No hay lista de Flatpak para instalar."
fi

# 3. Instalar paquetes Snap
if [ -s "$PACKAGES_DIR/snap.txt" ]; then
    echo "  >> Instalando aplicaciones Snap..."
    if ! command -v snap &> /dev/null; then
        echo "Instalando snapd primero..."
        sudo apt install -y snapd
    fi
    xargs -a "$PACKAGES_DIR/snap.txt" -I {} sudo snap install {}
else
    echo "  >> No hay lista de Snap para instalar."
fi

# 4. Instalar Starship
if ! command -v starship &> /dev/null; then
    echo "  >> Instalando Starship prompt..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y
else
    echo "  >> Starship ya está instalado."
fi

# 5. Instalar Oh My Zsh y plugins
if [ ! -d ~/.oh-my-zsh ]; then
    echo "  >> Instalando Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "  >> Oh My Zsh ya está instalado."
fi

# Descargar plugins de Oh My Zsh si no existen
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "  >> Descargando zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "  >> Descargando zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# 6. Instalar Extensiones de VS Code
if [ -s "$PACKAGES_DIR/vscode-extensions.txt" ]; then
    if command -v code &> /dev/null; then
        echo "  >> Instalando extensiones de VS Code..."
        while read -r ext; do
            [ -z "$ext" ] && continue
            code --install-extension "$ext" --force
        done < "$PACKAGES_DIR/vscode-extensions.txt"
    else
        echo "  >> VS Code no está instalado (o no está en el PATH). Omitiendo extensiones."
    fi
fi
