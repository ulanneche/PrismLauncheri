# 🎮 Quartz Launcher

> Play Minecraft without Microsoft account! / Играйте в Minecraft без аккаунта Microsoft!

[![License](https://img.shields.io/badge/license-GPL--3.0-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey.svg)]()
[![Build](https://img.shields.io/badge/build-passing-brightgreen.svg)]()

[🇷🇺 Русская версия](README_OFFLINE_RU.md) | [🇬🇧 English Version](#english)

---

## 🇷🇺 Русская версия

### ✨ Что это?

**Quartz Launcher** - это модифицированная версия PrismLauncher с полностью удаленной системой авторизации Microsoft.

### 🎯 Особенности

✅ **Без Microsoft** - не требуется аккаунт  
✅ **Автономный** - работает без интернета  
✅ **Без диалогов входа** - никаких окон авторизации  
✅ **Автоматические офлайн-аккаунты**  
✅ **Поддержка модов** - Forge, Fabric, Quilt  
✅ **Модпаки** - CurseForge, Modrinth, FTB  

### 📥 Установка

```bash
git clone https://github.com/your-repo/QuartzLauncher.git
cd QuartzLauncher
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release -j4
```

**Подробная инструкция:** [BUILD_INSTRUCTIONS_RU.md](BUILD_INSTRUCTIONS_RU.md)

### 📚 Документация

- 📖 [Полное описание изменений](OFFLINE_ONLY_CHANGES.md)
- 📝 [Краткая инструкция](ИНСТРУКЦИЯ.txt)
- 📋 [Краткая сводка](SUMMARY_RU.md)
- 🔨 [Инструкция по компиляции](BUILD_INSTRUCTIONS_RU.md)
- 📚 [Индекс документации](INDEX_DOCUMENTS.md)

### ⚠️ Ограничения

❌ Не работают лицензионные серверы  
❌ Нельзя менять скины через Microsoft  
✅ Работает одиночная игра и пиратские серверы  

---

## 🇬🇧 English

### ✨ What is this?

**Quartz Launcher** is a modified version of PrismLauncher with Microsoft authentication completely removed.

### 🎯 Features

✅ **No Microsoft** - no account required  
✅ **Fully offline** - works without internet  
✅ **No login dialogs** - no authentication windows  
✅ **Automatic offline accounts**  
✅ **Mod support** - Forge, Fabric, Quilt  
✅ **Modpacks** - CurseForge, Modrinth, FTB  

### 📥 Installation

```bash
git clone https://github.com/your-repo/QuartzLauncher.git
cd QuartzLauncher
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release -j4
```

**Detailed instructions:** [BUILD_INSTRUCTIONS_RU.md](BUILD_INSTRUCTIONS_RU.md) (Russian)

### 📚 Documentation

- 📖 [Full changelog](OFFLINE_ONLY_CHANGES.md) (Russian)
- 📋 [Summary](SUMMARY_RU.md) (Russian)
- 📚 [Documentation index](INDEX_DOCUMENTS.md) (Russian)

Most documentation is in Russian. English translation coming soon.

### ⚠️ Limitations

❌ Licensed servers don't work  
❌ Can't change skins via Microsoft  
✅ Singleplayer and cracked servers work  

---

## 🔧 What was changed?

**5 files modified:**
- `LaunchController.cpp` - Removed authentication checks
- `Application.cpp` - Disabled login wizard
- `AuthSession.cpp` - Improved offline mode
- `VersionPage.cpp` - Removed account check for downloads
- `AccountList.cpp` - Offline accounts are now valid

**Details:** [OFFLINE_ONLY_CHANGES.md](OFFLINE_ONLY_CHANGES.md) (Russian)

---

## 🎮 How it works now

### First launch:
```
Before: Wizard → Microsoft Login → Auth Dialog
Now:    Wizard → Language/Java/Theme → Done!
```

### Game launch:
```
Before: Check account → Select account → Refresh token → Launch
Now:    Auto-create offline account → Launch
```

### Download Minecraft:
```
Before: Check Microsoft account → Download
Now:    Download immediately
```

---

## 📋 Requirements

### To run:
- Windows 10+, Linux, macOS 11+
- Java 8+ (for old Minecraft)
- Java 17+ (for Minecraft 1.18+)

### To compile:
- CMake 3.15+
- Qt 6.x
- C++20 compiler (GCC 11+, Clang 14+, MSVC 2019+)

---

## ❓ FAQ

**Q: Can I play on licensed servers?**  
A: No, Microsoft account required.

**Q: Do mods work?**  
A: Yes! All mods and modpacks work normally.

**Q: Can I change skins?**  
A: No, Microsoft skin management is disabled.

**Q: Is internet required?**  
A: Only for downloading Minecraft and mods. Game launch works fully offline.

**Q: Can I restore Microsoft authentication?**  
A: Yes, use original PrismLauncher or revert changes via git.

---

## 🤝 Credits

Original PrismLauncher: https://github.com/PrismLauncher/PrismLauncher

**Quartz Launcher** is a modification with removed Microsoft authentication system.

---

## 📜 License

GPL-3.0 - same as original PrismLauncher.

---

## ⚠️ Disclaimer

This modification is intended for legal use with purchased Minecraft in singleplayer or on cracked servers. We don't encourage piracy - buy the game if you like Minecraft!

---

## 🌟 Quick Links

| Link | Description |
|------|-------------|
| [📖 Full Changes (RU)](OFFLINE_ONLY_CHANGES.md) | Complete technical description |
| [📝 User Guide (RU)](ИНСТРУКЦИЯ.txt) | Simple instructions |
| [📋 Summary (RU)](SUMMARY_RU.md) | Quick overview |
| [🔨 Build Guide (RU)](BUILD_INSTRUCTIONS_RU.md) | Compilation instructions |
| [📚 Docs Index (RU)](INDEX_DOCUMENTS.md) | Documentation index |
| [📋 Changelog (RU)](CHANGELOG_OFFLINE.md) | Detailed changelog |

---

**Made with ❤️ for Minecraft community**

*Release date: July 9, 2026*
