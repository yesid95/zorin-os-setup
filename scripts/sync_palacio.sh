#!/bin/bash
# Script de sincronización SILENCIOSA para el Palacio Mental (Lumethik Elite)

REMOTO="gdrive"
RUTA_NUBE="$REMOTO:🏰Palacio Mental"
RUTA_LOCAL="$HOME/Documentos/Palacio-Mental"
CONCURRENCY=4
LOCK_FILE="/tmp/sync_palacio.lock"

# Iconos Estándar
ICON_DONE="emblem-ok-symbolic"
ICON_ERROR="dialog-error-symbolic"

# 1. Verificación de Directorio Local
if [ ! -d "$RUTA_LOCAL" ]; then
    mkdir -p "$RUTA_LOCAL"
fi

# 2. Mecanismo de Bloqueo (Evita ejecuciones concurrentes)
if ! mkdir "$LOCK_FILE" 2>/dev/null; then
    # Si la carpeta existe, verificamos si es vieja (stale)
    # Si tiene más de 1 hora, la borramos por seguridad
    if [ "$(( $(date +%s) - $(stat -c %Y "$LOCK_FILE") ))" -gt 3600 ]; then
        rm -rf "$LOCK_FILE"
        mkdir "$LOCK_FILE"
    else
        echo "Sincronización ya en curso o bloqueada. Saliendo..."
        exit 0
    fi
fi

# Asegurar limpieza al salir
trap 'rm -rf "$LOCK_FILE"' EXIT

# 3. Función de Sincronización Silenciosa
func_sync() {
    # Ejecución de Bisync (Bidireccional)
    OUTPUT=$(/usr/bin/rclone bisync "$RUTA_NUBE" "$RUTA_LOCAL" --verbose --transfers $CONCURRENCY 2>&1)
    
    # Verificamos si se requiere resync (por conflicto o primera vez)
    if echo "$OUTPUT" | grep -q "\-\-resync"; then
        OUTPUT=$(/usr/bin/rclone bisync "$RUTA_NUBE" "$RUTA_LOCAL" --verbose --transfers $CONCURRENCY --resync 2>&1)
    fi

    # Validación de Resultado
    if echo "$OUTPUT" | grep -q "ERROR :"; then
        return 1
    else
        return 0
    fi
}

# 4. Ejecución
if func_sync; then
    # Éxito: Notificación discreta (No interrumpe el flujo de trabajo)
    notify-send -u low -i "$ICON_DONE" "Palacio Mental" "Sincronización completada con éxito."
    echo "✅ Sincronización exitosa."
else
    # Error: Notificación crítica (Requiere atención del usuario)
    notify-send -u critical -i "$ICON_ERROR" "Error en Palacio Mental" "Ocurrió un problema al sincronizar. Revisa los logs de rclone."
    echo "❌ Error en la sincronización."
fi
