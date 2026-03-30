#!/bin/bash

# --- 1. DEFINICIÓN DE RUTAS VALIDADAS ---
PIPER_DIR="$HOME/piper-tts"
PIPER_EXE="$PIPER_DIR/piper"
MODELO="$PIPER_DIR/davefx.onnx"

# --- 2. CAPTURA INTELIGENTE DEL PORTAPAPELES ---
# Detecta si wl-paste (Wayland) está disponible y funciona
if command -v wl-paste >/dev/null 2>&1; then
    TEXTO=$(wl-paste)
# Si no, hace un fallback seguro a xclip (X11)
elif command -v xclip >/dev/null 2>&1; then
    TEXTO=$(xclip -selection clipboard -o)
else
    notify-send "Error Técnico" "Faltan herramientas de portapapeles. Instala xclip y wl-clipboard."
    exit 1
fi

# --- 3. LÓGICA DE EJECUCIÓN ---
if [ -z "$TEXTO" ]; then
    notify-send "Piper TTS" "No se detectó texto. Revisa si OnlyOffice copió correctamente."
else
    notify-send "Piper TTS" "Procesando lectura..."
    # Limpiamos caracteres extraños que Flatpak a veces añade al portapapeles
    echo "$TEXTO" | tr -d '\r' | "$PIPER_EXE" --model "$MODELO" --output_raw | aplay -r 22050 -f S16_LE -t raw
fi
