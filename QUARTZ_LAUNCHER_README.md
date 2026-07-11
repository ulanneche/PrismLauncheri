# 🔮 Quartz Launcher - Полное руководство

## 🎯 Что это?

**Quartz Launcher** - это модифицированная версия PrismLauncher с:
- ✅ Полностью удаленной авторизацией Microsoft
- ✅ Работой только в офлайн-режиме
- ✅ Автоматическим созданием офлайн-аккаунтов
- ✅ Новым брендом и названием

---

## 📝 Что было изменено?

### 1. Удалена авторизация Microsoft

**6 файлов изменено:**

| Файл | Изменения |
|------|-----------|
| `LaunchController.cpp` | Убраны проверки авторизации, диалоги входа |
| `Application.cpp` | Отключен мастер входа при первом запуске |
| `AuthSession.cpp` | Улучшен офлайн-режим |
| `VersionPage.cpp` | Убрана проверка аккаунта при скачивании |
| `AccountList.cpp` | Офлайн-аккаунты теперь валидны |
| `program_info/CMakeLists.txt` | Ребренд на Quartz Launcher |

**Детали:** См. [OFFLINE_ONLY_CHANGES.md](OFFLINE_ONLY_CHANGES.md)

### 2. Ребренд на Quartz Launcher

**Имя проекта:**
- Было: PrismLauncher / Prism Launcher
- Стало: QuartzLauncher / Quartz Launcher

**Исполняемые файлы:**
- Windows: `quartzlauncher.exe`
- Linux: `quartzlauncher`
- macOS: `QuartzLauncher.app`

**Конфигурация:**
- AppID: `org.quartzlauncher.QuartzLauncher`
- Домен: `quartzlauncher.org`
- ENV: `QUARTZLAUNCHER`

**Детали:** См. [REBRAND_TO_QUARTZ.md](REBRAND_TO_QUARTZ.md)

---

## 🚀 Быстрый старт

### 1. Компиляция

```bash
# Windows
cd build
cmake ..
cmake --build . --config Release

# Linux/macOS
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release -j$(nproc)
```

**Подробно:** [BUILD_INSTRUCTIONS_RU.md](BUILD_INSTRUCTIONS_RU.md)

### 2. Переименование файлов (опционально)

```bash
# Windows
rename_files_to_quartz.bat

# Linux/macOS
chmod +x rename_files_to_quartz.sh
./rename_files_to_quartz.sh
```

### 3. Запуск

```bash
# Windows
build\launcher\Release\quartzlauncher.exe

# Linux
build/launcher/quartzlauncher

# macOS
open build/launcher/QuartzLauncher.app
```

---

## 📚 Документация

### Основные документы

| Документ | Описание |
|----------|----------|
| [README.md](README.md) | Главный README (RU/EN) |
| [ИНСТРУКЦИЯ.txt](ИНСТРУКЦИЯ.txt) | Простая инструкция для пользователей |
| [SUMMARY_RU.md](SUMMARY_RU.md) | Краткая сводка изменений |

### Технические документы

| Документ | Описание |
|----------|----------|
| [OFFLINE_ONLY_CHANGES.md](OFFLINE_ONLY_CHANGES.md) | Полное описание изменений авторизации |
| [REBRAND_TO_QUARTZ.md](REBRAND_TO_QUARTZ.md) | Описание ребренда |
| [CHANGELOG_OFFLINE.md](CHANGELOG_OFFLINE.md) | Детальный changelog |
| [BUILD_INSTRUCTIONS_RU.md](BUILD_INSTRUCTIONS_RU.md) | Инструкция по компиляции |

### Утилиты

| Файл | Описание |
|------|----------|
| `rename_files_to_quartz.bat` | Скрипт переименования (Windows) |
| `rename_files_to_quartz.sh` | Скрипт переименования (Linux/macOS) |
| `cleanup_unused_auth_files.bat` | Удаление неиспользуемых файлов |

---

## 🎨 Брендинг

### Название
- **Полное:** Quartz Launcher
- **Короткое:** QuartzLauncher
- **Executable:** quartzlauncher

### Концепция
🔮 **Кварц** - прозрачный минерал, символизирующий:
- ✨ Прозрачность работы (нет скрытой авторизации)
- 💎 Надежность и стабильность
- 🌈 Чистота (только нужные функции)

### Цветовая схема (рекомендуемая)
- **Основной:** #9370DB (Medium Purple)
- **Акцент:** #DA70D6 (Orchid)
- **Фон:** #2C2C3E (Dark Slate)
- **Текст:** #E8E8F0 (Light Gray)

### Иконка (требуется создать)
- Геометрический кристалл кварца
- Минималистичный стиль
- Векторный формат (SVG)
- Размеры: 16x16, 32x32, 48x48, 256x256

---

## 📦 Структура проекта

```
QuartzLauncher/
├── launcher/               # Исходный код лаунчера
│   ├── LaunchController.cpp   # Логика запуска (изменен)
│   ├── Application.cpp        # Главное приложение (изменен)
│   └── minecraft/auth/        # Система авторизации (изменена)
├── program_info/          # Конфигурация и ресурсы
│   ├── CMakeLists.txt         # Настройки проекта (изменен)
│   ├── quartzlauncher.ico     # Иконка Windows
│   ├── quartzlauncher.icns    # Иконка macOS
│   └── org.quartzlauncher.*   # Desktop/MetaInfo файлы
├── buildconfig/           # Конфигурация сборки
├── cmake/                 # CMake модули
├── docs/                  # Документация
│   ├── README.md
│   ├── SUMMARY_RU.md
│   ├── OFFLINE_ONLY_CHANGES.md
│   ├── REBRAND_TO_QUARTZ.md
│   └── ...
└── build/                 # Папка сборки (создается)
```

---

## ⚙️ Конфигурация

### Пути хранения данных

**Windows:**
```
%APPDATA%\QuartzLauncher\
├── accounts.json          # Список аккаунтов
├── quartzlauncher.cfg     # Настройки
├── instances/             # Инстансы Minecraft
└── assets/                # Ресурсы игры
```

**Linux:**
```
~/.local/share/QuartzLauncher/
~/.config/QuartzLauncher/
```

**macOS:**
```
~/Library/Application Support/QuartzLauncher/
```

### Переменные окружения

```bash
# Java
QUARTZLAUNCHER_JAVA_PATH=/path/to/java

# Папка данных
QUARTZLAUNCHER_DATA_DIR=/custom/path

# Папка инстансов
QUARTZLAUNCHER_INSTANCES_DIR=/custom/instances
```

---

## 🧪 Тестирование

### Проверка после компиляции

- [ ] Лаунчер запускается
- [ ] Заголовок окна: "Quartz Launcher"
- [ ] Не показывается окно входа Microsoft
- [ ] Можно создать офлайн-аккаунт
- [ ] Можно создать инстанс
- [ ] Игра запускается без диалогов

### Проверка брендинга

- [ ] Исполняемый файл: `quartzlauncher*`
- [ ] В About: "Quartz Launcher"
- [ ] Конфиг в папке `QuartzLauncher/`
- [ ] Иконка отображается (если создана)

---

## 🐛 Известные ограничения

### Не работает:
❌ Вход в Microsoft аккаунт  
❌ Игра на лицензионных серверах  
❌ Управление скинами через Microsoft  
❌ Проверка лицензии Minecraft  

### Работает:
✅ Одиночная игра  
✅ LAN-игры  
✅ Пиратские серверы (online-mode=false)  
✅ Все моды и модпаки  
✅ Скачивание версий Minecraft  

---

## 🔧 Разработка

### Добавление новых функций

1. Форкните репозиторий
2. Создайте ветку: `git checkout -b feature/new-feature`
3. Внесите изменения
4. Закоммитьте: `git commit -m "Add new feature"`
5. Запушьте: `git push origin feature/new-feature`
6. Создайте Pull Request

### Стиль кода

- Следуйте существующему стилю кода
- Используйте clang-format (`.clang-format` в корне)
- Комментируйте сложные участки
- Пишите понятные commit messages

---

## 📜 Лицензия

GPL-3.0 - та же лицензия, что и у оригинального PrismLauncher.

---

## 🙏 Благодарности

- **PrismLauncher** - оригинальный лаунчер
- **PolyMC** - предшественник PrismLauncher
- **MultiMC** - основа для всех форков
- **Сообщество Minecraft** - за поддержку

---

## ⚠️ Дисклеймер

Quartz Launcher предназначен для легального использования:
- Одиночная игра с купленной версией Minecraft
- Игра на пиратских серверах (по согласованию с владельцами)
- Тестирование модов и модпаков

Мы **не поощряем пиратство**. Если вам нравится Minecraft - купите игру!

---

## 🌟 Ссылки

- **GitHub:** https://github.com/YourGitHub/QuartzLauncher
- **Оригинал:** https://github.com/PrismLauncher/PrismLauncher
- **Документация:** См. папку docs/

---

**Версия:** 1.0.0  
**Дата релиза:** 09.07.2026  
**Статус:** ✅ Готов к использованию

**Made with ❤️ for Minecraft community**
