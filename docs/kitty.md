# 🐈 Kitty Terminal (Lumethik Elite Edition)

Este documento detalla la configuración y personalización del emulador de terminal Kitty para el entorno de trabajo corporativo de Lumethik en Zorin OS.

## 🚀 Instalación y Reemplazo

Para instalar Kitty y establecerlo como la terminal predeterminada:

```bash
sudo apt update && sudo apt install kitty -y
# Configurar como terminal predeterminada
sudo update-alternatives --config x-terminal-emulator
```

## 🔧 Ubicación de Archivos

| Archivo | Ruta Local | Ruta en Repositorio |
| :--- | :--- | :--- |
| **Configuración** | `~/.config/kitty/kitty.conf` | `dotfiles/config/kitty/kitty.conf` |

## 🎨 Características del Diseño

La terminal ha sido optimizada para ofrecer una estética premium y analítica:

*   **Tema de Color:** [Gruvbox Dark Hard](https://github.com/morhetz/gruvbox) (Fondo: `#282828`, Texto: `#ebdbb2`).
*   **Transparencia:** Configurada al **90%** (`background_opacity 0.90`) para un efecto moderno sin perder legibilidad.
*   **Tipografía:** **JetBrainsMono Nerd Font** (Tamaño 10.0) para soporte completo de iconos en la terminal.
*   **Espaciado:** `window_padding_width 12` para separar el texto de los bordes físicos.

## ⌨️ Atajos de Teclado (Estilo Windows/Zorin)

Se han mapeado atajos familiares para facilitar la transición:

*   **Copiar:** `Ctrl + C` (Si hay texto seleccionado, copia; si no, actúa como interrupción usual).
*   **Pegar:** `Ctrl + V` (Pega directamente desde el portapapeles del sistema).

## ⚠️ Notas de Compatibilidad (Zorin OS / GNOME)

Para asegurar que los botones de la ventana (cerrar, minimizar, maximizar) sean visibles en el entorno GNOME de Zorin OS, se ha forzado el uso del servidor de pantalla X11 en la configuración:

```conf
linux_display_server x11
hide_window_decorations no
```

---
*Última actualización: 2 de Abril de 2026 (Migración a Kit de Herramientas Elite)*
