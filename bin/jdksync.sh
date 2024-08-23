#!/bin/bash

# Comprobamos si se han proporcionado los parámetros
if [ -z "$1" ]; then
    echo "No se ha proporcionado ningún comando."
    echo "Uso: jdksync comando [opciones]"
    echo "Use jdksync help' para ver los comandos disponibles."
    exit 1
fi

# Comando help
if [ "$1" == "help" ]; then
    if [ -z "$2" ]; then
        echo "Comandos disponibles:"
        echo
        echo "    help           Muestra esta ayuda."
        echo "    sync           Sincronizar JDK"
        exit 0
    fi
    
    if [ "$2" == "sync" ]; then
        echo "Usage: sync <Jdk path>"
        echo
        exit 0
    fi
fi

# Comando sync
if [ "$1" == "sync" ]; then
    if [ -z "$2" ]; then
        echo "Usage: sync <Jdk path>"
        echo
        exit 1
    fi
    
    rm -rf "/jdksync/jdk"
    ln -s "$2" "/jdksync/jdk"
    exit 0
fi

# Comando list
if [ "$1" == "list" ]; then
    for d in /jdksync/jdks/*/ ; do
        echo "$d"
    done
    exit 0
fi
