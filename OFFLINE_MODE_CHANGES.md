# Изменения для офлайн режима PrismLauncher

## Сделанные изменения:

### 1. Удалена поддержка Microsoft аккаунтов
- Удалена кнопка "Add Microsoft" из интерфейса управления аккаунтами
- Удалена проверка на наличие Microsoft аккаунта при добавлении офлайн аккаунтов
- Изменено приветственное сообщение с рекомендацией добавить Microsoft аккаунт на рекомендацию добавить офлайн аккаунт
- Отключены кнопки "Manage Skins" и "Refresh" (не работают с офлайн аккаунтами)
- Обновлено сообщение об ошибке при попытке скачать игру без аккаунта

**Измененные файлы:**
- `launcher/ui/pages/global/AccountListPage.cpp`
- `launcher/ui/pages/global/AccountListPage.h`
- `launcher/ui/pages/global/AccountListPage.ui`
- `launcher/ui/pages/instance/VersionPage.cpp`

### 2. Улучшен доступ к офлайн запуску

#### 2.1. Офлайн запуск сделан основным в выпадающем меню
- "Launch Offline" теперь первый пункт в меню (был вторым)
- "Launch Offline" выделен жирным шрифтом для лучшей видимости
- "Launch" переименован в "Launch (Online)" для ясности

**Измененные файлы:**
- `launcher/minecraft/MinecraftInstance.cpp`

#### 2.2. Добавлена отдельная кнопка "Launch Offline" в главный интерфейс
- Новая кнопка "Launch Offline" добавлена в боковую панель инструментов
- Кнопка также добавлена в меню File
- Горячая клавиша: Ctrl+Shift+O

**Измененные файлы:**
- `launcher/ui/MainWindow.ui`
- `launcher/ui/MainWindow.h`
- `launcher/ui/MainWindow.cpp`

## Результат:

Теперь PrismLauncher:
1. Работает только с офлайн аккаунтами (без требования Microsoft аккаунта)
2. Имеет удобный доступ к офлайн запуску через отдельную кнопку
3. Офлайн режим выделен как основной способ запуска

## Компиляция:

Для применения изменений необходимо перекомпилировать проект:

```bash
cd build
cmake --build . --config Release
```

## Примечания:

- Все файлы MSA логина (MSALoginDialog.*) оставлены в проекте, но не используются
- Можно дополнительно удалить неиспользуемые файлы для очистки кодовой базы
- Функциональность управления скинами отключена, так как требует онлайн аккаунт

---

## Внешние зависимости от сервисов

PrismLauncher использует следующие внешние сервисы:

### 1. Обязательные для работы (критические):

#### Minecraft Services
- **libraries.minecraft.net** - загрузка библиотек Minecraft
- **resources.download.minecraft.net** - загрузка игровых ресурсов (текстуры, звуки, и т.д.)
- **piston-meta.mojang.com** (через META_URL) - метаданные версий Minecraft

> ⚠️ **Критично:** Без этих сервисов невозможно скачать и запустить игру впервые

#### Metadata Index (Версии игры и модлоадеров)
- **META_URL** (настраивается в BuildConfig) - индекс метаданных для:
  - Версий Minecraft (`net.minecraft`)
  - Forge, Fabric, Quilt и других модлоадеров
  - Промежуточных компонентов (LWJGL, и т.д.)

### 2. Онлайн-аккаунты (ОТКЛЮЧЕНО в вашей версии):

#### Microsoft Authentication
- **login.microsoftonline.com** - OAuth авторизация Microsoft
- **user.auth.xboxlive.com** - Xbox Live аутентификация
- **xsts.auth.xboxlive.com** - Xbox токен сервис
- **api.minecraftservices.com** - Minecraft профили и сервисы
  - `/minecraft/profile` - информация о профиле
  - `/minecraft/profile/skins` - управление скинами
  - `/minecraft/profile/capes/active` - управление плащами
  - `/entitlements/license` - проверка лицензии
  - `/launcher/login` - логин через launcher

#### Legacy Services
- **sessionserver.mojang.com** - сессии Mojang (устаревшее)

### 3. Платформы модов (опциональные):

#### Modrinth
- **api.modrinth.com** - API для поиска и загрузки модов
- **cdn.modrinth.com** - CDN для скачивания файлов
- **staging-api.modrinth.com** - тестовое API

#### CurseForge
- **api.curseforge.com** - API для поиска и загрузки модов
- **edge.forgecdn.net** - CDN для скачивания файлов

#### Feed The Beast (FTB)
- **api.feed-the-beast.com** - API для модпаков FTB
- **dist.creeper.host** - CDN для загрузки FTB модпаков

#### ATLauncher
- **api.atlauncher.com** - API для модпаков ATLauncher
- **download.nodecdn.net** - CDN для загрузки ATLauncher модпаков

#### Technic Platform
- **api.technicpack.net** - API для модпаков Technic

### 4. Дополнительные сервисы (опциональные):

#### Обновления лаунчера
- **UPDATER_GITHUB_REPO** - GitHub репозиторий для проверки обновлений
- **MAC_SPARKLE_APPCAST_URL** - обновления для macOS через Sparkle

#### Новости и помощь
- **NEWS_RSS_URL** - RSS лента новостей лаунчера
- **NEWS_OPEN_URL** - страница с новостями
- **WIKI_URL** - документация лаунчера
- **HELP_URL** - страницы помощи

#### Социальные сети
- **MATRIX_URL** - Matrix пространство
- **DISCORD_URL** - Discord сервер
- **SUBREDDIT_URL** - Reddit сообщество

#### Другое
- **api.imgur.com** - загрузка скриншотов (опционально)
- **BUG_TRACKER_URL** - система отслеживания багов
- **TRANSLATIONS_URL** - файлы переводов

### 5. Как работать полностью оффлайн:

#### Для первого запуска (требуется интернет):
1. Скачать версию Minecraft через лаунчер (один раз)
2. Все необходимые библиотеки и ресурсы загрузятся автоматически

#### После первого запуска (оффлайн режим):
1. Создать офлайн аккаунт
2. Запустить игру через кнопку "Launch Offline"
3. Лаунчер не будет проверять онлайн сервисы

#### Настройки для минимизации онлайн зависимостей:
В настройках лаунчера можно отключить:
- `ModMetadataDisabled` - отключить метаданные модов
- `MetaRefreshOnLaunch` - не обновлять метаданные при запуске
- Проверку обновлений лаунчера

### 6. Локальное зеркалирование (для полной автономии):

Для работы без интернета вообще, можно:
1. Настроить локальное зеркало `libraries.minecraft.net`
2. Настроить локальное зеркало `resources.download.minecraft.net`
3. Настроить локальный META сервер
4. Изменить URL в `BuildConfig.h` перед компиляцией

Пример изменения в `buildconfig/BuildConfig.h`:
```cpp
QString DEFAULT_RESOURCE_BASE = "http://localhost:8080/resources/";
QString LIBRARY_BASE = "http://localhost:8080/libraries/";
QString META_URL = "http://localhost:8080/meta/";
```

### Выводы:

✅ **Работает полностью оффлайн после первой загрузки:**
- Запуск игры
- Офлайн аккаунты
- Локальные моды/ресурспаки

❌ **Требует интернет:**
- Первая загрузка версии Minecraft
- Загрузка модов с платформ (CurseForge, Modrinth)
- Обновление лаунчера
- Microsoft аккаунты (отключено в вашей версии)

