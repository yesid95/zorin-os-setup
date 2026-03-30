#!/bin/bash
# Script de sincronización bidireccional para el Palacio Mental

REMOTO="gdrive"
RUTA_NUBE="$REMOTO:🏰Palacio Mental"
RUTA_LOCAL="$HOME/Documentos/Palacio-Mental"

# Previene bucles o archivos ocultos de rclone sin resolver
CONCURRENCY=4

echo "=== Sincronización Rclone Bisync ==="
echo "Nube: $RUTA_NUBE"
echo "Local: $RUTA_LOCAL"
echo "-------------------------------------"

if [ ! -d "$RUTA_LOCAL" ]; then
    mkdir -p "$RUTA_LOCAL"
    echo "Directorio local creado."
fi

# NOTA IMPORTANTE: La primera vez que se ejecute la sincronización
# O si hubo una desincronización crítica, se debe correr manualmente con --resync
# Ejemplo: rclone bisync "gdrive:🏰Palacio Mental" "$HOME/Documentos/Palacio-Mental" --resync

# Ejecución estándar para el Cron/Timer
/usr/bin/rclone bisync "$RUTA_NUBE" "$RUTA_LOCAL" --verbose --transfers $CONCURRENCY

if [ $? -eq 0 ]; then
    echo "Sincronización exitosa."
else
    echo "Error en sincronización. Revisa los logs de rclone."
    # notify-send "Rclone Bisync" "Error sincronizando el Palacio Mental"
fi
