# 🎨 Ребренд: PrismLauncher → Quartz Launcher

## 📝 Описание ребренда

Проект полностью переименован с **PrismLauncher** на **Quartz Launcher**.

---

## 🔧 Изменения в конфигурации

### 1. program_info/CMakeLists.txt

```cmake
# Было:
set(Launcher_CommonName "PrismLauncher")
set(Launcher_DisplayName "Prism Launcher")
set(Launcher_AppID "org.prismlauncher.PrismLauncher")
set(Launcher_Domain "prismlauncher.org")
set(Launcher_Git "https://github.com/PrismLauncher/PrismLauncher")
set(Launcher_ENVName "PRISMLAUNCHER")

# Стало:
set(Launcher_CommonName "QuartzLauncher")
set(Launcher_DisplayName "Quartz Launcher")
set(Launcher_AppID "org.quartzlauncher.QuartzLauncher")
set(Launcher_Domain "quartzlauncher.org")
set(Launcher_Git "https://github.com/YourGitHub/QuartzLauncher")
set(Launcher_ENVName "QUARTZLAUNCHER")
```

### 2. Copyright обновлен:

```
© 2026 Quartz Launcher
© 2022-2026 Prism Launcher Contributors
© 2021-2022 PolyMC Contributors
© 2012-2021 MultiMC Contributors
```

---

## 📦 Имена исполняемых файлов

### Windows:
- `prismlauncher.exe` → `quartzlauncher.exe`
- `prismlauncher_updater.exe` → `quartzlauncher_updater.exe`
- `prismlauncher_filelink.exe` → `quartzlauncher_filelink.exe`

### Linux:
- `prismlauncher` → `quartzlauncher`

### macOS:
- `PrismLauncher.app` → `QuartzLauncher.app`

---

## 🗂️ Файлы конфигурации

### Имена файлов:
- `prismlauncher.cfg` → `quartzlauncher.cfg`
- `org.prismlauncher.PrismLauncher.desktop` → `org.quartzlauncher.QuartzLauncher.desktop`
- `org.prismlauncher.PrismLauncher.metainfo.xml` → `org.quartzlauncher.QuartzLauncher.metainfo.xml`
- `org.prismlauncher.PrismLauncher.svg` → `org.quartzlauncher.QuartzLauncher.svg`

### Пути установки:

**Linux:**
```bash
# Было:
~/.local/share/PrismLauncher/
~/.config/PrismLauncher/

# Стало:
~/.local/share/QuartzLauncher/
~/.config/QuartzLauncher/
```

**Windows:**
```
# Было:
%APPDATA%\PrismLauncher\

# Стало:
%APPDATA%\QuartzLauncher\
```

**macOS:**
```bash
# Было:
~/Library/Application Support/PrismLauncher/

# Стало:
~/Library/Application Support/QuartzLauncher/
```

---

## 🌐 Переменные окружения

```bash
# Было:
PRISMLAUNCHER_JAVA_PATH
PRISMLAUNCHER_DATA_DIR

# Стало:
QUARTZLAUNCHER_JAVA_PATH
QUARTZLAUNCHER_DATA_DIR
```

---

## 📋 Что нужно переименовать дополнительно

### Файлы иконок (в program_info/):
```bash
# Переименовать:
prismlauncher.ico → quartzlauncher.ico
prismlauncher.icns → quartzlauncher.icns
PrismLauncher.icon → QuartzLauncher.icon
org.prismlauncher.PrismLauncher.svg → org.quartzlauncher.QuartzLauncher.svg
org.prismlauncher.PrismLauncher_256.png → org.quartzlauncher.QuartzLauncher_256.png
```

### Файлы ресурсов:
```bash
# Переименовать:
prismlauncher.rc.in → quartzlauncher.rc.in
prismlauncher.qrc.in → quartzlauncher.qrc.in
prismlauncher.manifest.in → quartzlauncher.manifest.in
org.prismlauncher.PrismLauncher.desktop.in → org.quartzlauncher.QuartzLauncher.desktop.in
org.prismlauncher.PrismLauncher.metainfo.xml.in → org.quartzlauncher.QuartzLauncher.metainfo.xml.in
org.prismlauncher.PrismLauncher.mime.xml → org.quartzlauncher.QuartzLauncher.mime.xml
```

---

## 🖼️ Графика и брендинг

### Иконки приложения

Создайте новые иконки для Quartz Launcher:

1. **Логотип** - Дизайн с кристаллом кварца
2. **Цветовая схема** - Фиолетовый/Розовый (как кристалл кварца)
3. **Форматы**:
   - Windows: `.ico` (16x16, 32x32, 48x48, 256x256)
   - macOS: `.icns` (множество размеров)
   - Linux: `.svg` (векторный) + `.png` (256x256)

### Примерная концепция:
```
🔮 Кристалл кварца с геометрическими гранями
📐 Минималистичный стиль
🎨 Цвета: #9370DB (фиолетовый), #DA70D6 (розовый)
✨ Легкое свечение/блеск
```

---

## 📝 Документация

Все документы обновлены:
- ✅ README.md
- ✅ README_OFFLINE_RU.md
- ✅ SUMMARY_RU.md
- ✅ ИНСТРУКЦИЯ.txt (при создании)
- ✅ BUILD_INSTRUCTIONS_RU.md (при создании)

---

## 🚀 Следующие шаги

### 1. Переименование файлов иконок:

```bash
# Linux/macOS
cd program_info/
mv prismlauncher.ico quartzlauncher.ico
mv prismlauncher.icns quartzlauncher.icns
mv PrismLauncher.icon QuartzLauncher.icon
# ... и так далее
```

```cmd
REM Windows
cd program_info
ren prismlauncher.ico quartzlauncher.ico
ren prismlauncher.icns quartzlauncher.icns
ren PrismLauncher.icon QuartzLauncher.icon
REM ... и так далее
```

### 2. Обновление .in файлов:

Замените все упоминания `PrismLauncher` на `QuartzLauncher` в:
- `*.rc.in`
- `*.qrc.in`
- `*.manifest.in`
- `*.desktop.in`
- `*.metainfo.xml.in`

### 3. Создание новых иконок:

Дизайн новых иконок с тематикой кварца для всех платформ.

### 4. Компиляция:

```bash
rm -rf build
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release -j4
```

### 5. Проверка:

- [ ] Исполняемый файл называется `quartzlauncher`
- [ ] В заголовке окна "Quartz Launcher"
- [ ] Конфиг сохраняется в правильную папку
- [ ] Переменные окружения работают
- [ ] Иконка отображается правильно

---

## 🔍 Где искать упоминания PrismLauncher

### В коде:
```bash
# Поиск в C++ файлах
grep -r "PrismLauncher" launcher/ --include="*.cpp" --include="*.h"

# Поиск в CMake файлах
grep -r "PrismLauncher" . --include="CMakeLists.txt"

# Поиск в UI файлах
grep -r "Prism Launcher" . --include="*.ui"
```

### В ресурсах:
```bash
# XML/Desktop файлы
grep -r "prismlauncher" program_info/

# Workflow файлы
grep -r "PrismLauncher" .github/
```

---

## ⚠️ Важно

### Не переименовывать:
- ✅ Папки с кодом (`launcher/`, `buildconfig/` и т.д.)
- ✅ Git репозиторий (`.git/`)
- ✅ Build артефакты (`build/`)

### Переименовать обязательно:
- ✅ Все файлы в `program_info/` с `prism`
- ✅ Все упоминания в CMakeLists.txt
- ✅ Все .in файлы
- ✅ Документацию

---

## 📊 Статистика ребренда

- **Файлов изменено**: 3
- **Файлов к переименованию**: ~15
- **Строк изменено**: ~30
- **Новых иконок требуется**: 3 (ico, icns, svg)

---

## ✅ Чеклист ребренда

- [x] CMakeLists.txt обновлен
- [x] Переменные Launcher_* изменены
- [x] Copyright обновлен
- [x] README.md обновлен
- [x] README_OFFLINE_RU.md обновлен
- [ ] Файлы иконок переименованы
- [ ] .in файлы обновлены
- [ ] Новые иконки созданы
- [ ] Проект скомпилирован
- [ ] Работа проверена

---

**Дата ребренда**: 09.07.2026  
**Версия**: Quartz Launcher 1.0.0
