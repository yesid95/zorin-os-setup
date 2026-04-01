#!/bin/bash
# Script de sincronización visual para el Palacio Mental

REMOTO="gdrive"
RUTA_NUBE="$REMOTO:🏰Palacio Mental"
RUTA_LOCAL="$HOME/Documentos/Palacio-Mental"
CONCURRENCY=4

# Definimos iconos (Zorin suele tener estos nombres de iconos estándar)
ICON_SYNC="folder-remote-symbolic"
ICON_DONE="emblem-ok-symbolic"
ICON_ERROR="dialog-error-symbolic"

if [ ! -d "$RUTA_LOCAL" ]; then
    mkdir -p "$RUTA_LOCAL"
fi

# Función principal de sincronización con reporte visual
func_sync() {
    echo "# Iniciando comparación de archivos..."
    OUTPUT=$(/usr/bin/rclone bisync "$RUTA_NUBE" "$RUTA_LOCAL" --verbose --transfers $CONCURRENCY 2>&1)
    
    # Verificamos si se requiere resync
    if echo "$OUTPUT" | grep -q "\-\-resync"; then
        echo "# Detectada desincronización. Auto-reparando (--resync)..."
        OUTPUT=$(/usr/bin/rclone bisync "$RUTA_NUBE" "$RUTA_LOCAL" --verbose --transfers $CONCURRENCY --resync 2>&1)
    fi

    # Verificamos el resultado final
    if echo "$OUTPUT" | grep -q "ERROR :"; then
        return 1
    else
        return 0
    fi
}

# Ejecución con Zenity
(
    func_sync
    # Pasamos el código de salida al proceso padre
    exit $?
) | zenity --progress \
    --title="Sincronización del Palacio" \
    --text="Actualizando archivos en la nube..." \
    --pulsate \
    --auto-close \
    --width=400

# Capturamos el resultado de la tubería
if [ $? -eq 0 ]; then
    notify-send -i "$ICON_DONE" "Sincronización Exitosa" "Tu Palacio Mental está al día."
    echo "✅ Sincronización exitosa."
else
    notify-send -i "$ICON_ERROR" "Error de Sincronización" "Ocurrió un problema al sincronizar. Revisa los logs."
    echo "❌ Error en la sincronización."
fi
