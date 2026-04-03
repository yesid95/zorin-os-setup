# 🌠 Starship Cross-Shell Prompt (Lumethik Theme)

Starship es el encargado de dar vida al prompt de la terminal, ofreciendo información contextual relevante (Git, versión de lenguajes, ruta actual) de forma instantánea y visualmente atractiva.

## 🛠️ Instalación Universal

Para instalar la última versión de Starship en Zorin OS:

```bash
curl -sS https://starship.rs/install.sh | sh
```

### Inicialización en la Shell
Para que Starship cargue automáticamente en Zsh, se ha añadido la siguiente línea al final de tu archivo `~/.zshrc`:

```bash
eval "$(starship init zsh)"
```

## 🔧 Ubicación de Archivos

| Componente | Ruta Local | Ruta en Repositorio |
| :--- | :--- | :--- |
| **Configuración TOML** | `~/.config/starship.toml` | `dotfiles/config/starship/starship.toml` |

## 🎨 Características de la Configuración Lumethik

### 1. Estilo Powerline (Separadores)
El prompt utiliza símbolos de Powerline para crear un efecto de flujo continuo en colores:
*   **Inicio:** `` (Borde redondeado izquierdo).
*   **Transiciones:** `` (Separador triangular).
*   **Fin:** `` (Borde redondeado derecho).

### 2. Paleta de Colores Gruvbox
Se ha integrado una paleta técnica basada en Gruvbox Dark para mantener la armonía visual:
*   **Usuario:** Naranja (`color_orange`).
*   **Directorio:** Amarillo (`color_yellow`).
*   **Git:** Aqua (`color_aqua`).
*   **Máquina/Runtime:** Azul (`color_blue`).

### 3. Módulos Personalizados
*   **Directorio Inteligente:** Muestra iconos específicos para carpetas comunes (`󰈙 Documents`, `󰲋 Developer`).
*   **Estado de Git:** Indica ramas, commits pendientes y estado del repositorio de forma visual.
*   **Runtimes de Programación:** Detecta automáticamente si estás en un proyecto de Python, NodeJS, Go, Rust, etc., y muestra la versión correspondiente.
*   **Reloj:** Integra un reloj discreto al final del prompt (` HH:MM`).

---
*Última actualización: 2 de Abril de 2026 (Refuerzo de módulos y paleta técnica)*
