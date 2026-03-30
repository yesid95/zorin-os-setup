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

# Capturamos la salida para buscar el mensaje de error de resync
OUTPUT=$(/usr/bin/rclone bisync "$RUTA_NUBE" "$RUTA_LOCAL" --verbose --transfers $CONCURRENCY 2>&1)

# Imprimimos la salida para los logs de systemd
echo "$OUTPUT"

# Si contiene la palabra resync, auto-reparamos
if echo "$OUTPUT" | grep -q "\-\-resync"; then
    echo "⚠️ Se detectó corrupción de caché por un apagado repentino. Auto-reparando con --resync..."
    /usr/bin/rclone bisync "$RUTA_NUBE" "$RUTA_LOCAL" --verbose --transfers $CONCURRENCY --resync
    if [ $? -eq 0 ]; then
         echo "✅ Auto-reparación exitosa."
    else
         echo "❌ Error fatal en auto-reparación. Revisa rclone."
    fi
else
    # Si no nos pidió resync, validamos que Rclone haya terminado bien buscando errores críticos
    if echo "$OUTPUT" | grep -q "ERROR :"; then
        echo "❌ Error en sincronización por otra causa. Revisa los logs de rclone."
    else
        echo "✅ Sincronización exitosa."
    fi
fi


