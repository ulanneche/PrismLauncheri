# 🔨 Инструкция по компиляции Quartz Launcher (Offline Edition)

## ✅ Изменения уже применены!

Все изменения для удаления авторизации Microsoft уже внесены в код. Проект переименован в **Quartz Launcher**. Теперь нужно только скомпилировать проект.

## 📋 Требования

### Windows:
- CMake 3.15+
- Visual Studio 2019+ или MinGW
- Qt 6.x
- Git

### Linux:
- CMake 3.15+
- GCC 11+ или Clang 14+
- Qt 6.x
- Git

### macOS:
- CMake 3.15+
- Xcode 13+
- Qt 6.x
- Git

## 🔧 Компиляция

### Windows (PowerShell):

```powershell
# 1. Очистка старой сборки (если есть)
if (Test-Path build) { Remove-Item -Recurse -Force build }

# 2. Создание папки сборки
mkdir build
cd build

# 3. Настройка проекта
cmake .. -DCMAKE_BUILD_TYPE=Release

# 4. Компиляция
cmake --build . --config Release -j4

# 5. Готово! Исполняемый файл в:
# build/launcher/Release/quartzlauncher.exe
```

### Windows (CMD):

```cmd
REM 1. Очистка старой сборки
if exist build rmdir /s /q build

REM 2. Создание папки сборки
mkdir build
cd build

REM 3. Настройка проекта
cmake .. -DCMAKE_BUILD_TYPE=Release

REM 4. Компиляция
cmake --build . --config Release -j4

REM 5. Готово! Исполняемый файл в:
REM build\launcher\Release\quartzlauncher.exe
```

### Linux:

```bash
# 1. Очистка старой сборки (если есть)
rm -rf build

# 2. Создание папки сборки
mkdir build
cd build

# 3. Настройка проекта
cmake .. -DCMAKE_BUILD_TYPE=Release

# 4. Компиляция
cmake --build . --config Release -j$(nproc)

# 5. Готово! Исполняемый файл в:
# build/launcher/quartzlauncher
```

### macOS:

```bash
# 1. Очистка старой сборки (если есть)
rm -rf build

# 2. Создание папки сборки
mkdir build
cd build

# 3. Настройка проекта
cmake .. -DCMAKE_BUILD_TYPE=Release

# 4. Компиляция
cmake --build . --config Release -j$(sysctl -n hw.ncpu)

# 5. Готово! Приложение в:
# build/launcher/QuartzLauncher.app
```

## ⚡ Быстрая компиляция (один файл)

Создайте файл `compile.bat` (Windows) или `compile.sh` (Linux/macOS):

### Windows (compile.bat):
```batch
@echo off
if exist build rmdir /s /q build
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release -j4
echo.
echo ========================================
echo Готово! Файл: build\launcher\Release\quartzlauncher.exe
echo ========================================
pause
```

### Linux/macOS (compile.sh):
```bash
#!/bin/bash
rm -rf build
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release -j$(nproc 2>/dev/null || sysctl -n hw.ncpu)
echo
echo "========================================"
echo "Готово! Файл: build/launcher/quartzlauncher"
echo "========================================"
```

Затем запустите:
```bash
# Linux/macOS
chmod +x compile.sh
./compile.sh

# Windows
compile.bat
```

## 🐛 Решение проблем

### Ошибка: "Qt not found"

**Windows:**
```powershell
# Установите путь к Qt
cmake .. -DCMAKE_PREFIX_PATH="C:\Qt\6.5.0\msvc2019_64"
```

**Linux:**
```bash
# Установите Qt из репозитория
sudo apt install qt6-base-dev qt6-5compat-dev libqt6svg6-dev

# Или укажите путь вручную
cmake .. -DCMAKE_PREFIX_PATH="/opt/Qt/6.5.0/gcc_64"
```

**macOS:**
```bash
# Установите через Homebrew
brew install qt@6

# Или укажите путь вручную
cmake .. -DCMAKE_PREFIX_PATH="/usr/local/opt/qt@6"
```

### Ошибка: "CMake too old"

Обновите CMake до версии 3.15 или новее:

**Windows:**
Скачайте с https://cmake.org/download/

**Linux:**
```bash
sudo snap install cmake --classic
```

**macOS:**
```bash
brew upgrade cmake
```

### Ошибка компиляции C++

Убедитесь, что компилятор поддерживает C++20:
- GCC 11+ 
- Clang 14+
- MSVC 2019+

## 📦 Создание установщика (опционально)

### Windows (NSIS):
```cmd
cd build
cpack -G NSIS
```

### Linux (DEB/RPM):
```bash
cd build
cpack -G DEB  # Debian/Ubuntu
cpack -G RPM  # Fedora/RHEL
```

### macOS (DMG):
```bash
cd build
cpack -G DragNDrop
```

## ✅ Проверка сборки

После компиляции запустите лаунчер:

```bash
# Windows
build\launcher\Release\quartzlauncher.exe

# Linux
build/launcher/quartzlauncher

# macOS
open build/launcher/QuartzLauncher.app
```

Должно произойти:
1. ✅ Лаунчер запускается без ошибок
2. ✅ Не показывается окно входа Microsoft
3. ✅ В Settings → Accounts видна только кнопка "Add Offline"
4. ✅ Можно создать инстанс и запустить игру

## 📝 Примечания

- Время компиляции: ~5-15 минут (зависит от процессора)
- Размер сборки: ~500 МБ (build/)
- Размер готового лаунчера: ~50-100 МБ
- Первая компиляция всегда дольше последующих

## 🚀 После компиляции

1. Запустите лаунчер
2. Пройдите начальную настройку (язык, Java)
3. Добавьте инстанс Minecraft
4. Нажмите Launch - игра запустится автоматически!

---

**Удачной компиляции! 🎉**
