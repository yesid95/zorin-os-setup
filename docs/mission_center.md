# 🖥️ Mission Center (Monitor de Sistema Pro)

Mission Center es una aplicación de monitorización de alto rendimiento para Linux que ofrece una experiencia visualmente rica y detallada de los recursos de tu ordenador, inspirada en el Administrador de Tareas de Windows pero optimizada para el ecosistema moderno de Linux.

## 🚀 Acceso Rápido
Para mayor eficiencia, se ha configurado el atajo estándar de la industria:
*   **Atajo:** `Ctrl + Shift + Esc`
*   **Comando Interno:** `flatpak run io.missioncenter.MissionCenter`

## 📊 Funcionalidades Clave

1.  **Monitorización en Tiempo Real:** 
    *   **CPU:** Uso por núcleo, velocidad y gráficos de rendimiento histórico.
    *   **RAM:** Uso detallado y memoria de intercambio (swap).
    *   **Disco:** Velocidades de lectura/escritura y tiempo de respuesta.
    *   **Red:** Gráficos de envío y recepción de datos.
    *   **GPU:** Soporte nativo para monitorizar el uso de procesadores gráficos.
2.  **Gestión de Procesos:** Visualización de todas las aplicaciones activas con consumo de recursos individualizado.
3.  **Información del Sistema:** Detalles sobre el hardware, versión del kernel y tiempo de actividad (uptime).

## 🛠️ Detalles de Instalación

Este software se gestiona a través de **Flatpak** para garantizar que siempre tengas la versión más reciente y estable disponible:
*   **ID de Aplicación:** `io.missioncenter.MissionCenter`
*   **Origen:** Flathub

## ⚠️ Resolución de Problemas
Si el atajo `Ctrl + Shift + Esc` no responde:
1.  Asegúrate de que Mission Center está instalado: `flatpak list | grep MissionCenter`
2.  Verifica el registro en dconf: `gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings`

---
*Configuración Elite Lumethik - Telemetría Avanzada y Control de Recursos.*
