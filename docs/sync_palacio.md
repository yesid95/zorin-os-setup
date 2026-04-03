# 🏰 Palacio Mental (Sincronización Silenciosa)

El "Palacio Mental" es el sistema centralizado de conocimiento de Lumethik. Para asegurar que todos los documentos estén siempre disponibles y protegidos, se ha implementado un sistema de sincronización bidireccional automática y silenciosa entre el equipo local y Google Drive.

## 🛠️ Arquitectura del Sistema

La automatización se basa en tres componentes que trabajan en conjunto como un servicio de fondo:

1.  **Rclone (Motor):** Utiliza `bisync` para comparar cambios en ambos sentidos (nube <-> local) y resolver conflictos.
2.  **Systemd (Cerebro):** 
    *   `rclone-palacio.timer`: Despachador que activa la sincronización cada **5 minutos**.
    *   `rclone-palacio.service`: Define la ejecución del script como una tarea de sistema de usuario.
3.  **Bash Script (Lógica):** `sync_palacio.sh` gestiona las notificaciones y evita colisiones.

## 🔧 Ubicación de Componentes

| Componente | Ruta Local | Ruta en Repositorio |
| :--- | :--- | :--- |
| **Script de Lógica** | `~/Documentos/.../scripts/sync_palacio.sh` | `scripts/sync_palacio.sh` |
| **Temporizador** | `~/.config/systemd/user/rclone-palacio.timer` | `dotfiles/systemd/user/rclone-palacio.timer` |
| **Servicio** | `~/.config/systemd/user/rclone-palacio.service` | `dotfiles/systemd/user/rclone-palacio.service` |

## 🎨 Operación No Intrusiva

A diferencia de las versiones anteriores, este sistema ha sido optimizado para **no interrumpir el flujo de trabajo**:

*   **Sin Ventanas:** Se ha eliminado el uso de Zenity Progress. Todo ocurre en segundo plano.
*   **Gestión de Bloqueo:** El script crea un archivo temporal `/tmp/sync_palacio.lock`. Si una sincronización está en curso, las peticiones nuevas se descartan para evitar sobrecargar el sistema.
*   **Notificaciones Inteligentes:**
    *   **Éxito (Prioridad Baja):** Una burbuja discreta aparece y desaparece rápidamente. No se guarda en el historial de notificaciones.
    *   **Error (Prioridad Crítica):** Solo si la sincronización falla (ej. sin internet), aparece una alerta roja persistente que requiere atención.

## ⌨️ Uso Manual

Aunque es automático, puedes forzar una sincronización en cualquier momento:
*   **Atajo:** `Super + Alt + P`
*   **Comando:** `bash ~/Documentos/Proyectos\ Python/zorin-os-setup/scripts/sync_palacio.sh`

## ⚠️ Solución de Problemas

Si notas que los archivos no se sincronizan:
1.  **Verificar Timer:** `systemctl --user status rclone-palacio.timer`
2.  **Verificar Logs:** `journalctl --user -u rclone-palacio.service`
3.  **Limpiar Bloqueo:** Si el script se colgó, borra la carpeta: `rm -rf /tmp/sync_palacio.lock`

---
*Última actualización: 2 de Abril de 2026 (Modernización a Modo Silencioso)*
