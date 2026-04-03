# Manual Técnico de Scripts y Configuración

Este documento detalla el funcionamiento, uso y mantenimiento de los scripts de automatización incluidos en este repositorio para Zorin OS.

## 📋 Directorio de Scripts

| Script | Propósito |
| :--- | :--- |
| `01-packages.sh` | Instalación masiva de paquetes (APT, Flatpak, Snap) + Starship + Oh My Zsh. |
| `02-dotfiles.sh` | Sincronización de dotfiles (`.zshrc`, `.gitconfig`, etc.) y cambio a Zsh. |
| `03-settings.sh` | Carga de configuraciones de entorno de escritorio (dconf). |
| `04-shortcuts.sh` | Registro automatizado de atajos de teclado personalizados. |
| `sync_palacio.sh` | Sincronización silenciosa con Google Drive (Rclone). |
| `leer_office.sh` | Lector de texto Piper TTS. |
| `stop_tts.sh` | Detiene Piper o Orca inmediatamente. |
| `backup.sh` | (Raíz) Respaldo completo de paquetes, dotfiles y ajustes. |

---

## ⌨️ Referencia de Atajos de Teclado

Se han configurado los siguientes atajos para facilitar el flujo de trabajo diario:

| Acción | Atajo | Función |
| :--- | :--- | :--- |
| **Sincronizar Palacio** | `Super + Alt + P` | Ejecuta la sincronización **silenciosa**. Muestra una notificación discreta al concluir o una alerta crítica en caso de error. No interrumpe el flujo de trabajo. |
| **Monitor Sistema** | `Ctrl + Shift + Esc` | Abre **Mission Center** para monitorizar CPU, RAM, Disco y Red en tiempo real. |
| **Iniciar Lectura** | `Ctrl + Alt + S` | Lee el texto actualmente copiado en el portapapeles. |
| **Detener Lectura** | `Ctrl + Alt + X` | Detiene Piper TTS y desactiva el lector Orca si está encendido. |

---

## 🔧 Mantenimiento del Repositorio

Para asegurar que tu repositorio esté actualizado antes de una migración, sigue estos pasos:

1. **Actualizar Todo:** Para capturar paquetes nuevos, cambios en `.zshrc` o ajustes de GNOME:
   ```bash
   ./backup.sh
   ```
2. **Guardar Cambios:** Sube los cambios a tu repositorio:
   ```bash
   git add .
   git commit -m "Actualización: Respaldo completo (Zsh, UI, Apps)"
   git push
   ```

---

## 🐚 Experiencia de Terminal Moderna

Hemos migrado a un entorno **Zsh** con esteroides:
- **Starship:** Prompt ultra rápido y personalizable visualmente.
- **Oh My Zsh:** Gestión de plugins (autosuggestions, syntax-highlighting).
- **LSD:** Reemplazo de `ls` con iconos y colores (configurar fuente Nerd Font recomendada).
- **Batcat:** Reemplazo de `cat` con resaltado de sintaxis (alias `cat`).
- **FZF:** Búsqueda difusa de archivos e historial (`Ctrl + R`, `Ctrl + T`).

---

## ⚠️ Solución de Problemas (Troubleshooting)

### Conflicto con el Lector de Pantalla (Orca)
En Zorin OS/GNOME, el atajo `Alt + Super + S` activa por defecto el Lector de Pantalla (Orca). Esto puede causar que el sistema empiece a leer todo lo que toca el ratón.

- **Síntoma:** El sistema lee elementos al mover el ratón o cambiar de ventana.
- **Solución:** Presiona el atajo de **Detener Lectura (`Ctrl + Alt + X`)**. El script `stop_tts.sh` está diseñado para desactivar Orca automáticamente en los ajustes del sistema y matar el proceso si está corriendo.
- **Prevención:** Hemos movido el atajo de sincronización a `Super + Alt + P` para evitar este conflicto.

---

---

*Última actualización: 1 de abril de 2026 (Refuerzo visual y corrección de conflicto de atajo)*
