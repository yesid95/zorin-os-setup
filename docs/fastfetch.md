# 🚀 Fastfetch System Branding (Lumethik Elite)

Fastfetch es la herramienta encargada de mostrar el reporte visual y técnico de Lumethik cada vez que se abre la terminal. Se ha personalizado para ofrecer una imagen de alta definición y un diseño de "soporte técnico" robusto.

## 🛠️ Instalación en Zorin OS

Fastfetch requiere una versión moderna para soportar el protocolo de imagen de Kitty. Se recomienda el uso del PPA oficial:

```bash
sudo add-apt-repository ppa:zhanghua/fastfetch
sudo apt update
sudo apt install fastfetch -y
```

## 🔧 Ubicación de Archivos y Activos

| Componente | Ruta Local | Ruta en Repositorio |
| :--- | :--- | :--- |
| **Configuración JSONC** | `~/.config/fastfetch/config.jsonc` | `dotfiles/config/fastfetch/config.jsonc` |
| **Imágenes (Fox/Logo)** | `/home/lumethik/Imágenes/Fondos/` | `N/A (Copia de seguridad local)` |

## 🎨 Características del Diseño Élite

### 1. Renderizado de Imagen HD
Utilizamos el protocolo `kitty-direct` para evitar la pérdida de calidad. La imagen se ha configurado con dimensiones específicas para compensar el ratio de las celdas de la terminal:
*   **Ancho:** 35 columnas.
*   **Alto:** 18 filas.
*   **Resultado:** Un cuadrado 1:1 perfecto en pantalla.

### 2. Estructura de "Soporte Técnico" (Brackets)
Se ha abandonado el diseño de cajas cerradas tradicionales por un estilo de **Corchetes Técnicos** (`╔══` y `║`). 
*   **Propósito:** Permite que los datos crezcan dinámicamente sin romper la simetría del marco.
*   **Acabado:** Se utiliza una paleta de colores Magenta y Cyan para diferenciar secciones de Hardware y Sistema.

### 3. Estrategia de Alineación (Space Buffer)
Para evitar que la imagen "tape" o "coma" los bordes izquierdos de las cajas, se ha implementado un buffer de espacio:
*   **Padding Logo:** Configurado en `18` para separar el bloque visual del texto.
*   **Indentación de Texto:** Cada línea de información comienza con un espacio en blanco intencional en el JSON de configuración para proteger los caracteres `║` de cualquier glitch de renderizado.

## 📁 Banner Corporativo
El título superior "LUMETHIK" se genera mediante bloques ASCII personalizados integrados directamente en el archivo `config.jsonc` como módulos `custom`.

---
*Última actualización: 2 de Abril de 2026 (Refuerzo de píxeles y alineación geométrica)*
