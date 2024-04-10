#!/bin/sh 
# Comprobar si grim o grimblast están instalados
if ! command -v grimblast &> /dev/null; then
    echo "grimblast no está instalado. Por favor, instala grimblast."
    exit 1
fi

# Función para capturar la captura de pantalla según el parámetro
capturar_pantalla() {
    case $1 in
        "-s")
            grimblast copy screen 
            ;;
        "-a")
            grimblast copy area
            ;;
        *)
            echo "Uso: $0 <-s | -a>"
            exit 1
            ;;
    esac
}

# Comprobar si se proporciona un parámetro
if [ -z "$1" ]; then
    echo "Uso: $0 <-s | -a>"
    exit 1
fi

# Capturar la captura de pantalla según el parámetro
capturar_pantalla "$1"
