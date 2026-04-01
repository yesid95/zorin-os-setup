#!/bin/bash
# Configuración de atajos de teclado personalizados (Zorin OS/GNOME)

# Función para registrar un atajo personalizado
register_shortcut() {
    local NAME="$1"
    local COMMAND="$2"
    local BINDING="$3"
    local ID="$4"
    local PATH_TO_CUSTOM="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/$ID/"

    echo ">> Configurando atajo: $NAME ($BINDING)..."

    # 1. Configurar propiedades
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$PATH_TO_CUSTOM name "$NAME"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$PATH_TO_CUSTOM command "$COMMAND"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$PATH_TO_CUSTOM binding "$BINDING"

    # 2. Agregar a la lista maestra sin borrar existentes
    local CURRENT_LIST=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)
    local NEW_LIST=""

    if [[ "$CURRENT_LIST" == "@as []" ]]; then
        NEW_LIST="['$PATH_TO_CUSTOM']"
    elif [[ "$CURRENT_LIST" == *"'$PATH_TO_CUSTOM'"* ]]; then
        echo "   (El atajo ya está en la lista maestra)"
        return
    else
        NEW_LIST="${CURRENT_LIST%]*}, '$PATH_TO_CUSTOM']"
    fi

    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$NEW_LIST"
    echo "   (Atajo registrado)"
}

# --- ATALJOS A CONFIGURAR ---

# 1. Sincronizar Palacio Mental
register_shortcut \
    "Sincronizar Palacio Mental" \
    "/bin/bash \"/home/lumethik/Documentos/Proyectos Python/zorin-os-setup/scripts/sync_palacio.sh\"" \
    "<Super><Alt>p" \
    "custom-sync-palacio"

# 2. Detener Lectura TTS
register_shortcut \
    "Detener Lectura TTS" \
    "/bin/bash \"/home/lumethik/Documentos/Proyectos Python/zorin-os-setup/scripts/stop_tts.sh\"" \
    "<Control><Alt>x" \
    "custom-stop-tts"

echo "✅ Atajos configurados correctamente."
