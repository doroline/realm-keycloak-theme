@echo off
setlocal

set "BUILD_DIR=.\target"
set "JAR_FILE=realm-theme.jar"

if exist "%BUILD_DIR%\%JAR_FILE%" del "%BUILD_DIR%\%JAR_FILE%"
if not exist "%BUILD_DIR%" mkdir "%BUILD_DIR%"

docker run ^
    --rm ^
    -v "%BUILD_DIR%:/target" ^
    -v "%cd%:/app/theme" ^
    openjdk:21-slim ^
    jar cvf /target/realm-theme.jar -C /app ./theme/realm-theme -C /app/theme ./META-INF

echo Build completata: %BUILD_DIR%\%JAR_FILE%

endlocal
