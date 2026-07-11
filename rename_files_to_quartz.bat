@echo off
REM ========================================================================
REM Скрипт для переименования файлов PrismLauncher в QuartzLauncher
REM ========================================================================
REM ВНИМАНИЕ: Запускайте из корневой папки проекта!
REM ========================================================================

echo.
echo ========================================================================
echo   ПЕРЕИМЕНОВАНИЕ ФАЙЛОВ: PrismLauncher ^> QuartzLauncher
echo ========================================================================
echo.
echo ВНИМАНИЕ! Этот скрипт переименует следующие файлы:
echo.
echo   - prismlauncher.ico ^> quartzlauncher.ico
echo   - prismlauncher.icns ^> quartzlauncher.icns
echo   - PrismLauncher.icon ^> QuartzLauncher.icon
echo   - org.prismlauncher.* ^> org.quartzlauncher.*
echo.
echo ========================================================================
echo.

set /p confirm="Вы уверены что хотите переименовать эти файлы? (yes/no): "
if /i not "%confirm%"=="yes" (
    echo Отменено пользователем.
    pause
    exit /b 0
)

echo.
echo Переименование файлов...
echo.

cd program_info

REM Иконки
if exist prismlauncher.ico (
    ren prismlauncher.ico quartzlauncher.ico
    echo [OK] prismlauncher.ico ^> quartzlauncher.ico
)

if exist prismlauncher.icns (
    ren prismlauncher.icns quartzlauncher.icns
    echo [OK] prismlauncher.icns ^> quartzlauncher.icns
)

if exist PrismLauncher.icon (
    ren PrismLauncher.icon QuartzLauncher.icon
    echo [OK] PrismLauncher.icon ^> QuartzLauncher.icon
)

REM .in файлы
if exist prismlauncher.rc.in (
    ren prismlauncher.rc.in quartzlauncher.rc.in
    echo [OK] prismlauncher.rc.in ^> quartzlauncher.rc.in
)

if exist prismlauncher.qrc.in (
    ren prismlauncher.qrc.in quartzlauncher.qrc.in
    echo [OK] prismlauncher.qrc.in ^> quartzlauncher.qrc.in
)

if exist prismlauncher.manifest.in (
    ren prismlauncher.manifest.in quartzlauncher.manifest.in
    echo [OK] prismlauncher.manifest.in ^> quartzlauncher.manifest.in
)

if exist prismlauncher.6.scd.in (
    ren prismlauncher.6.scd.in quartzlauncher.6.scd.in
    echo [OK] prismlauncher.6.scd.in ^> quartzlauncher.6.scd.in
)

REM Desktop файлы
if exist org.prismlauncher.PrismLauncher.desktop.in (
    ren org.prismlauncher.PrismLauncher.desktop.in org.quartzlauncher.QuartzLauncher.desktop.in
    echo [OK] org.prismlauncher.PrismLauncher.desktop.in ^> org.quartzlauncher.QuartzLauncher.desktop.in
)

REM MetaInfo файлы
if exist org.prismlauncher.PrismLauncher.metainfo.xml.in (
    ren org.prismlauncher.PrismLauncher.metainfo.xml.in org.quartzlauncher.QuartzLauncher.metainfo.xml.in
    echo [OK] org.prismlauncher.PrismLauncher.metainfo.xml.in ^> org.quartzlauncher.QuartzLauncher.metainfo.xml.in
)

REM MIME файлы
if exist org.prismlauncher.PrismLauncher.mime.xml (
    ren org.prismlauncher.PrismLauncher.mime.xml org.quartzlauncher.QuartzLauncher.mime.xml
    echo [OK] org.prismlauncher.PrismLauncher.mime.xml ^> org.quartzlauncher.QuartzLauncher.mime.xml
)

REM SVG иконки
if exist org.prismlauncher.PrismLauncher.svg (
    ren org.prismlauncher.PrismLauncher.svg org.quartzlauncher.QuartzLauncher.svg
    echo [OK] org.prismlauncher.PrismLauncher.svg ^> org.quartzlauncher.QuartzLauncher.svg
)

if exist org.prismlauncher.PrismLauncher.Source.svg (
    ren org.prismlauncher.PrismLauncher.Source.svg org.quartzlauncher.QuartzLauncher.Source.svg
    echo [OK] org.prismlauncher.PrismLauncher.Source.svg ^> org.quartzlauncher.QuartzLauncher.Source.svg
)

if exist org.prismlauncher.PrismLauncher.Social.svg (
    ren org.prismlauncher.PrismLauncher.Social.svg org.quartzlauncher.QuartzLauncher.Social.svg
    echo [OK] org.prismlauncher.PrismLauncher.Social.svg ^> org.quartzlauncher.QuartzLauncher.Social.svg
)

REM PNG иконки
if exist org.prismlauncher.PrismLauncher_256.png (
    ren org.prismlauncher.PrismLauncher_256.png org.quartzlauncher.QuartzLauncher_256.png
    echo [OK] org.prismlauncher.PrismLauncher_256.png ^> org.quartzlauncher.QuartzLauncher_256.png
)

cd ..

echo.
echo ========================================================================
echo   Файлы переименованы!
echo ========================================================================
echo.
echo ВНИМАНИЕ: Теперь нужно обновить содержимое .in файлов
echo Откройте каждый .in файл и замените:
echo   - PrismLauncher ^> QuartzLauncher
echo   - prismlauncher ^> quartzlauncher
echo   - org.prismlauncher ^> org.quartzlauncher
echo.
echo После этого перекомпилируйте проект:
echo   cd build
echo   cmake ..
echo   cmake --build . --config Release
echo.
echo ========================================================================
pause
