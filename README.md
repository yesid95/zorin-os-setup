# Zorin OS Setup

Este proyecto contiene una serie de scripts para automatizar el respaldo y la restauración de tu entorno Zorin OS (o distribuciones basadas en Ubuntu similares). 

Permite empaquetar tus paquetes (APT, Snap, Flatpak), configuraciones de terminal (**Zsh + Starship**), extensiones de VS Code y personalizaciones del escritorio para que migrar de equipo sea instantáneo y profesional.

## Uso

### 1. Respaldo de tu sistema actual

Simplemente ejecuta el script de respaldo en la raíz del repositorio. Capturará:
- Paquetes instalados (APT, Flatpak, Snap).
- Dotfiles clave (`.zshrc`, `.gitconfig`, `starship.toml`, etc.).
- Ajustes de GNOME/Zorin (dconf).
- Configuración de Rclone y scripts personalizados.

```bash
./backup.sh
```

> [!TIP]
> Después de correrlo, haz un `git init`, un commit y sube esto a tu repositorio privado en GitHub o GitLab.

### 2. Instalación en un equipo nuevo

1. Descarga/Clona este repositorio en tu nuevo equipo.
2. Ejecuta el script de instalación:

```bash
./install.sh
```

El script de instalación requerirá la confirmación de permisos de administrador (`sudo`) para instalar los paquetes. Automáticamente seguirá tres pasos: instalar paquetes, copiar dotfiles y aplicar configuraciones visuales del entorno de escritorio (dconf).

## Documentación Detallada

Para conocer el funcionamiento de cada script, los atajos de teclado configurados y cómo realizar el mantenimiento de este repositorio, consulta el [Manual de Usuario](docs/manual_usuario.md).

> [!NOTE]
> Es posible que al reinstalar ciertos atajos o temas visuales necesites reiniciar tu sesión para que gnome/dconf refresque los cambios.
