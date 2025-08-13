# ====================================================================
# SCRIPT DE LIMPIEZA DE ARCHIVOS TEMPORALES
# Creado para el Asistente de Programación
# ====================================================================

# Paso 1: Define la ruta de la carpeta temporal.
# La variable $TempPath contendrá la ruta completa a la carpeta de archivos temporales del usuario.
# La función 'Get-Item' recupera el objeto de la ruta.
$TempPath = Get-Item -Path "C:\Users\$env:USERNAME\AppData\Local\Temp"

# Paso 2: Mensaje de confirmación antes de la ejecución.
# Esto te informa qué carpeta se va a limpiar.
Write-Host "Iniciando la limpieza de la carpeta temporal: $TempPath" -ForegroundColor Yellow

# Paso 3: Elimina los archivos y subcarpetas dentro de la carpeta temporal.
# '-Path "$TempPath\*"' indica que se busquen todos los archivos y carpetas dentro de la ruta.
# '-Recurse' asegura que se eliminen también las subcarpetas y su contenido.
# '-Force' es necesario para eliminar archivos de solo lectura si existen.
# '-ErrorAction SilentlyContinue' ignora los errores si un archivo está en uso y no se puede eliminar,
# lo cual es normal en las carpetas temporales.

# NOTA DE SEGURIDAD:
# Por seguridad, la primera vez que lo uses, te recomiendo ejecutarlo con el parámetro -WhatIf
# Esto te mostrará qué archivos se eliminarían, sin eliminarlos realmente.
# Para ejecutarlo de forma segura, usa la siguiente línea (con -WhatIf):
Remove-Item -Path "$TempPath\*" -Recurse -Force -WhatIf -ErrorAction SilentlyContinue

# Cuando estés seguro de que el script funciona como esperas,
# elimina el '-WhatIf' de la línea de abajo para que el script borre los archivos.
# Remove-Item -Path "$TempPath\*" -Recurse -Force -ErrorAction SilentlyContinue

# Paso 4: Mensaje de finalización.
Write-Host "La limpieza ha finalizado." -ForegroundColor Green
