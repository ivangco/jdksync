param (
    [string]$command,
    [string]$path
)

# Comprobamos si se ha proporcionado un comando
if (-not $command) {
    Write-Host "No se ha proporcionado ningun comando."
    Write-Host "Uso: jdksync comando [opciones]"
    Write-Host "Use 'jdksync help' para ver los comandos disponibles."
    exit
}

# Comando help
if ($command -eq "help") {
    if (-not $path) {
        Write-Host "Comandos disponibles:"
        Write-Host
        Write-Host "    help           Muestra esta ayuda."
        Write-Host "    sync           Sincronizar JDK"
        exit
    }
    if ($path -eq "sync") {
        Write-Host "Usage: sync <Jdk path>"
        Write-Host
        exit
    }
}

# Comando sync
if ($command -eq "sync") {
    if (-not $path) {
        Write-Host "Usage: sync <Jdk path>"
        Write-Host
        exit
    }

    Remove-Item -Recurse -Force "C:\jdksync\jdk"
    New-Item -ItemType SymbolicLink -Path "C:\jdksync\jdk" -Target $path
    exit
}

# Comando list
if ($command -eq "list") {
    Get-ChildItem -Directory "C:\jdksync\jdks\" | ForEach-Object {
        Write-Host $_.FullName
    }
    exit
}
