@echo off
title INSTALADOR INVENTARIO RESTAURANTE
color 0A
echo ========================================
echo   INSTALADOR - INVENTARIO RESTAURANTE
echo ========================================
echo.

:: Crear carpeta en el Escritorio
echo Instalando aplicacion...
mkdir "%USERPROFILE%\Desktop\InventarioRestaurante" 2>nul

:: Copiar archivos
xcopy "%~dp0InventarioRestaurante\*" "%USERPROFILE%\Desktop\InventarioRestaurante\" /E /I /Y >nul

:: Crear Iniciar.bat (sin ventana visible)
(
echo @echo off
echo cd /d "%USERPROFILE%\Desktop\InventarioRestaurante"
echo start /min "" InventarioRestaurante.exe
echo timeout /t 3 /nobreak ^>nul
echo start http://localhost:8082
echo exit
) > "%USERPROFILE%\Desktop\InventarioRestaurante\Iniciar.bat"

:: Crear acceso directo en el Escritorio con ícono
powershell -Command "$WS = New-Object -ComObject WScript.Shell; $SC = $WS.CreateShortcut('%USERPROFILE%\Desktop\Inventario Restaurante.lnk'); $SC.TargetPath = '%USERPROFILE%\Desktop\InventarioRestaurante\Iniciar.bat'; $SC.WorkingDirectory = '%USERPROFILE%\Desktop\InventarioRestaurante'; $SC.IconLocation = '%USERPROFILE%\Desktop\InventarioRestaurante\restaurante.ico'; $SC.Save()"

echo.
echo ========================================
echo   INSTALACION COMPLETADA
echo ========================================
echo.
echo Acceso directo creado en el Escritorio
echo.
pause