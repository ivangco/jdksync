@echo off
setlocal

REM Comprobamos si se han proporcionado los parámetros
IF "%1"=="" (
    echo No se ha proporcionado ningun comando.
    echo Uso: jdksync comando [opciones]
    echo Use 'jdksync help' para ver los comandos disponibles.
    goto :eof
)

REM Comando help
IF /I "%1"=="help" (
    IF "%2"=="" (
        echo Comandos disponibles:
        echo.
        echo     help           Muestra esta ayuda.
        echo     sync          syncronizar jdk 
        goto :eof
    )
    IF "%2"=="sync" ( 
        echo     "Usage: sync <Jdk path>"
        echo.
        goto :eof
    ) 

)

REM Comando sync
IF /I "%1"=="sync" (

    IF "%2"=="" ( 
        echo     "Usage: sync <Jdk path>"
        echo.
        goto :eof
    ) 
    rmdir "C:\jdksync\jdk"
    mklink /D "C:\jdksync\jdk" %2 
)
 
REM Comando list
IF /I "%1"=="list" (
     for /d %%d in ("C:\jdksync\jdks\*") do echo %%d 
)
 