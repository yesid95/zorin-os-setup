# Zorin OS Setup

Este proyecto contiene una serie de scripts para automatizar el respaldo y la restauración de tu entorno Zorin OS (o distribuciones basadas en Ubuntu similares). 

Actúa empaquetando tus listas de paquetes instalados y archivos de configuración para que configurar un equipo nuevo sea sumamente rápido, todo con solo un par de comandos.

## Uso

### 1. Respaldo de tu sistema actual

Simplemente ejecuta el script de respaldo en tu sistema actual. Guardará un registro de tus paquetes instalados (APT, Flatpak, Snap), configuraciones del entorno de escritorio (dconf) y extensiones de VS Code. También copiará archivos clave como `.bashrc`, `.gitconfig` y carpetas esenciales de `.config`.

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

> [!NOTE]
> Es posible que al reinstalar ciertos atajos o temas visuales necesites reiniciar tu sesión para que gnome/dconf refresque los cambios.
