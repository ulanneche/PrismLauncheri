#!/bin/bash
# ========================================================================
# Скрипт для переименования файлов PrismLauncher в QuartzLauncher
# ========================================================================
# ВНИМАНИЕ: Запускайте из корневой папки проекта!
# ========================================================================

echo
echo "========================================================================"
echo "  ПЕРЕИМЕНОВАНИЕ ФАЙЛОВ: PrismLauncher > QuartzLauncher"
echo "========================================================================"
echo
echo "ВНИМАНИЕ! Этот скрипт переименует следующие файлы:"
echo
echo "  - prismlauncher.ico > quartzlauncher.ico"
echo "  - prismlauncher.icns > quartzlauncher.icns"
echo "  - PrismLauncher.icon > QuartzLauncher.icon"
echo "  - org.prismlauncher.* > org.quartzlauncher.*"
echo
echo "========================================================================"
echo

read -p "Вы уверены что хотите переименовать эти файлы? (yes/no): " confirm
if [ "$confirm" != "yes" ]; then
    echo "Отменено пользователем."
    exit 0
fi

echo
echo "Переименование файлов..."
echo

cd program_info || exit 1

# Иконки
[ -f prismlauncher.ico ] && mv prismlauncher.ico quartzlauncher.ico && echo "[OK] prismlauncher.ico > quartzlauncher.ico"
[ -f prismlauncher.icns ] && mv prismlauncher.icns quartzlauncher.icns && echo "[OK] prismlauncher.icns > quartzlauncher.icns"
[ -f PrismLauncher.icon ] && mv PrismLauncher.icon QuartzLauncher.icon && echo "[OK] PrismLauncher.icon > QuartzLauncher.icon"

# .in файлы
[ -f prismlauncher.rc.in ] && mv prismlauncher.rc.in quartzlauncher.rc.in && echo "[OK] prismlauncher.rc.in > quartzlauncher.rc.in"
[ -f prismlauncher.qrc.in ] && mv prismlauncher.qrc.in quartzlauncher.qrc.in && echo "[OK] prismlauncher.qrc.in > quartzlauncher.qrc.in"
[ -f prismlauncher.manifest.in ] && mv prismlauncher.manifest.in quartzlauncher.manifest.in && echo "[OK] prismlauncher.manifest.in > quartzlauncher.manifest.in"
[ -f prismlauncher.6.scd.in ] && mv prismlauncher.6.scd.in quartzlauncher.6.scd.in && echo "[OK] prismlauncher.6.scd.in > quartzlauncher.6.scd.in"

# Desktop файлы
[ -f org.prismlauncher.PrismLauncher.desktop.in ] && mv org.prismlauncher.PrismLauncher.desktop.in org.quartzlauncher.QuartzLauncher.desktop.in && echo "[OK] org.prismlauncher.PrismLauncher.desktop.in > org.quartzlauncher.QuartzLauncher.desktop.in"

# MetaInfo файлы
[ -f org.prismlauncher.PrismLauncher.metainfo.xml.in ] && mv org.prismlauncher.PrismLauncher.metainfo.xml.in org.quartzlauncher.QuartzLauncher.metainfo.xml.in && echo "[OK] org.prismlauncher.PrismLauncher.metainfo.xml.in > org.quartzlauncher.QuartzLauncher.metainfo.xml.in"

# MIME файлы
[ -f org.prismlauncher.PrismLauncher.mime.xml ] && mv org.prismlauncher.PrismLauncher.mime.xml org.quartzlauncher.QuartzLauncher.mime.xml && echo "[OK] org.prismlauncher.PrismLauncher.mime.xml > org.quartzlauncher.QuartzLauncher.mime.xml"

# SVG иконки
[ -f org.prismlauncher.PrismLauncher.svg ] && mv org.prismlauncher.PrismLauncher.svg org.quartzlauncher.QuartzLauncher.svg && echo "[OK] org.prismlauncher.PrismLauncher.svg > org.quartzlauncher.QuartzLauncher.svg"
[ -f org.prismlauncher.PrismLauncher.Source.svg ] && mv org.prismlauncher.PrismLauncher.Source.svg org.quartzlauncher.QuartzLauncher.Source.svg && echo "[OK] org.prismlauncher.PrismLauncher.Source.svg > org.quartzlauncher.QuartzLauncher.Source.svg"
[ -f org.prismlauncher.PrismLauncher.Social.svg ] && mv org.prismlauncher.PrismLauncher.Social.svg org.quartzlauncher.QuartzLauncher.Social.svg && echo "[OK] org.prismlauncher.PrismLauncher.Social.svg > org.quartzlauncher.QuartzLauncher.Social.svg"

# PNG иконки
[ -f org.prismlauncher.PrismLauncher_256.png ] && mv org.prismlauncher.PrismLauncher_256.png org.quartzlauncher.QuartzLauncher_256.png && echo "[OK] org.prismlauncher.PrismLauncher_256.png > org.quartzlauncher.QuartzLauncher_256.png"

cd ..

echo
echo "========================================================================"
echo "  Файлы переименованы!"
echo "========================================================================"
echo
echo "ВНИМАНИЕ: Теперь нужно обновить содержимое .in файлов"
echo "Откройте каждый .in файл и замените:"
echo "  - PrismLauncher > QuartzLauncher"
echo "  - prismlauncher > quartzlauncher"
echo "  - org.prismlauncher > org.quartzlauncher"
echo
echo "После этого перекомпилируйте проект:"
echo "  cd build"
echo "  cmake .."
echo "  cmake --build . --config Release"
echo
echo "========================================================================"
