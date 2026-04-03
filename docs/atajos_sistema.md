# ⌨️ Inventario de Atajos de Teclado (Zorin OS / Lumethik)

Este documento es un inventario técnico de los atajos de teclado activos en tu sistema. Su objetivo es proporcionar claridad sobre qué teclas están en uso para evitar conflictos con nuevas automatizaciones.

## 🛡️ Capa Lumethik (Personalizados)
Estos son los atajos creados específicamente para las herramientas de este repositorio.

| Herramienta | Atajo | Comando / Script |
| :--- | :--- | :--- |
| **Iniciar Lectura TTS** | `Ctrl + Alt + S` | `leer_office.sh` |
| **Sincronizar Palacio** | `Super + Alt + P` | `sync_palacio.sh` |
| **Detener Lectura TTS** | `Ctrl + Alt + X` | `stop_tts.sh` |
| **Caracteres / Emojis** | `Super + Coma (,)` | `gnome-characters` |

## ⚠️ Análisis de Conflictos Críticos

### 1. El Conflicto de la tecla "S" (Lector de Pantalla)
Este es el origen del "caos" reportado anteriormente.
*   **Tu Atajo:** `Ctrl + Alt + S` (Lectura de Texto).
*   **Atajo del Sistema:** `Super + Alt + S` (Activar Lector de Pantalla/Orca).
*   **Diagnóstico:** Debido a que ambos usan `Alt` y `S`, es extremadamente fácil pulsar la tecla `Super` por error en lugar de `Ctrl`. Esto activa el lector de pantalla de GNOME, que lee cada movimiento del ratón y cambia el comportamiento del foco.

### 2. Atajos de Sistema Comunes (`Super`)
Windows/Zorin utiliza la tecla `Super` para casi todas sus funciones principales:
*   `Super + A`: Menú de Aplicaciones.
*   `Super + V / M`: Bandeja de Mensajes/Notificaciones.
*   `Super + S`: Ajustes Rápidos (Zorin OS Pro).
*   `Super + L`: Bloquear pantalla.
*   `Super + D`: Ocultar todas las ventanas (Escritorio).

## 🧭 Recomendaciones para Futuros Atajos

Para evitar redundancia y conflictos:
1.  **Priorizar la Capa `Shift`**: Muchos atajos del sistema olvidan la tecla `Shift`. Usar `Super + Shift + [Tecla]` suele ser un "puerto seguro".
2.  **Zonificación de Teclas**: 
    -   **P** para Palacio/Productividad.
    -   **L** para Lectura (si decides mover el atajo de la S).
    -   **X** para eXit/Stop.
3.  **Evitar Proximidad**: Evitar usar `Alt + S` si el sistema ya tiene un atajo importante en esa misma letra pero con otro modificador.

---
*Este documento es solo informativo. No se han realizado cambios en la configuración del sistema durante su creación.*
