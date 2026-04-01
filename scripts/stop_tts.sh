#!/bin/bash
# Script para detener la lectura en voz alta (Piper TTS y Orca)

echo ">> Deteniendo procesos de lectura y accesibilidad..."

# 1. Desactivar el lector de pantalla de GNOME (Orca)
gsettings set org.gnome.desktop.a11y.applications screen-reader-enabled false

# 2. Matar procesos activos de forma limpia
pkill -f piper
pkill -f aplay
pkill -f orca
pkill -f leer_office.sh

# 3. Forzar el cierre si siguen vivos después de un breve momento
sleep 0.5
pkill -9 -f piper
pkill -9 -f aplay
pkill -9 -f orca
pkill -9 -f leer_office.sh

notify-send "Lectura detenida" "Piper TTS y Orca han sido desactivados."
echo "✅ Procesos eliminados y Accesibilidad desactivada."
