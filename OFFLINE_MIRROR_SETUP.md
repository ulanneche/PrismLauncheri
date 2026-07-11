# Настройка локального зеркала для полностью автономной работы

Это руководство поможет настроить PrismLauncher для работы без подключения к интернету.

## Архитектура

```
PrismLauncher
    ↓
Локальный HTTP сервер (nginx/apache)
    ↓
Локальное зеркало файлов Minecraft
```

## Что нужно зеркалировать

### 1. Библиотеки Minecraft
**Оригинал:** https://libraries.minecraft.net/
**Примеры файлов:**
- `/org/lwjgl/lwjgl/3.3.1/lwjgl-3.3.1.jar`
- `/com/mojang/authlib/3.11.49/authlib-3.11.49.jar`
- И сотни других библиотек...

### 2. Игровые ресурсы
**Оригинал:** https://resources.download.minecraft.net/
**Примеры файлов:**
- Текстуры, звуки, шрифты
- Хранятся в формате `/{hash[0:2]}/{hash}`
- Например: `/0a/0a1b2c3d4e5f...`

### 3. Метаданные версий
**Оригинал:** Зависит от META_URL в BuildConfig
**По умолчанию:** Репозиторий meta.prismlauncher.org
**Содержит:**
- version_manifest.json - список всех версий Minecraft
- Описания версий (JSON файлы)
- Информация о Forge, Fabric, Quilt, и т.д.

## Пошаговая инструкция

### Шаг 1: Загрузка необходимых файлов

#### Способ 1: Использовать уже запущенную игру
Все загруженные файлы хранятся локально в:
```
Windows: C:\Users\<username>\AppData\Roaming\PrismLauncher\
Linux: ~/.local/share/PrismLauncher/
macOS: ~/Library/Application Support/PrismLauncher/
```

Структура папок:
```
PrismLauncher/
├── libraries/          # Все библиотеки
├── assets/            # Игровые ресурсы
│   ├── indexes/       # Индексы версий ресурсов
│   └── objects/       # Сами файлы ресурсов (по хешу)
├── meta/              # Метаданные версий
└── instances/         # Ваши инстансы игры
```

#### Способ 2: Скачать заранее с интернета
1. Запустите PrismLauncher с интернетом
2. Создайте инстансы нужных версий Minecraft
3. Запустите каждую версию хотя бы раз (чтобы скачались все файлы)
4. Скопируйте папки `libraries`, `assets`, `meta`

### Шаг 2: Настройка HTTP сервера

#### Вариант A: Nginx (рекомендуется)

**Установка:**
```bash
# Ubuntu/Debian
sudo apt install nginx

# Windows (скачать с https://nginx.org/en/download.html)
```

**Конфигурация** (`/etc/nginx/sites-available/minecraft-mirror`):
```nginx
server {
    listen 8080;
    server_name localhost;
    
    # Библиотеки
    location /libraries/ {
        alias /path/to/PrismLauncher/libraries/;
        autoindex on;
        add_header Access-Control-Allow-Origin *;
    }
    
    # Ресурсы
    location /resources/ {
        alias /path/to/PrismLauncher/assets/objects/;
        autoindex on;
        add_header Access-Control-Allow-Origin *;
    }
    
    # Метаданные
    location /meta/ {
        alias /path/to/PrismLauncher/meta/;
        autoindex on;
        add_header Access-Control-Allow-Origin *;
        
        # Обязательно для JSON файлов
        types {
            application/json json;
        }
    }
}
```

**Включение:**
```bash
sudo ln -s /etc/nginx/sites-available/minecraft-mirror /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

#### Вариант B: Python HTTP Server (для тестирования)

```bash
# В папке с файлами
cd /path/to/PrismLauncher/
python3 -m http.server 8080
```

> ⚠️ **Внимание:** Python сервер не подходит для постоянного использования!

### Шаг 3: Модификация BuildConfig

Отредактируйте `buildconfig/BuildConfig.h`:

```cpp
// Было:
QString DEFAULT_RESOURCE_BASE = "https://resources.download.minecraft.net/";
QString LIBRARY_BASE = "https://libraries.minecraft.net/";
QString META_URL = "..."; // URL метаданных

// Стало:
QString DEFAULT_RESOURCE_BASE = "http://localhost:8080/resources/";
QString LIBRARY_BASE = "http://localhost:8080/libraries/";
QString META_URL = "http://localhost:8080/meta/";
```

### Шаг 4: Компиляция

```bash
cd build
cmake --build . --config Release
```

### Шаг 5: Проверка работы

1. **Отключите интернет** (или заблокируйте доступ в файерволе)
2. Запустите PrismLauncher
3. Создайте новый инстанс или откройте существующий
4. Запустите в офлайн режиме

## Расширенная настройка

### Добавление новых версий без интернета

1. На компьютере с интернетом:
   - Скачайте нужную версию через оригинальный PrismLauncher
   - Скопируйте новые файлы из `libraries/` и `assets/`
   - Обновите `meta/` папку

2. Перенесите файлы на компьютер с локальным зеркалом

3. Перезапустите HTTP сервер (если требуется)

### Синхронизация с официальными серверами

Для периодического обновления зеркала, создайте скрипт:

```bash
#!/bin/bash
# sync-minecraft-mirror.sh

MIRROR_DIR="/srv/minecraft-mirror"
PRISM_DATA="$HOME/.local/share/PrismLauncher"

# Копируем библиотеки
rsync -av "$PRISM_DATA/libraries/" "$MIRROR_DIR/libraries/"

# Копируем ресурсы
rsync -av "$PRISM_DATA/assets/objects/" "$MIRROR_DIR/resources/"

# Копируем метаданные
rsync -av "$PRISM_DATA/meta/" "$MIRROR_DIR/meta/"

echo "Синхронизация завершена: $(date)"
```

### Настройка для локальной сети

Если нужно предоставить доступ другим компьютерам в локальной сети:

1. В nginx измените `listen` на:
```nginx
listen 0.0.0.0:8080;
```

2. В BuildConfig используйте IP адрес сервера:
```cpp
QString LIBRARY_BASE = "http://192.168.1.100:8080/libraries/";
// и т.д.
```

3. Настройте файервол для разрешения подключений:
```bash
sudo ufw allow 8080/tcp
```

## Оценка размера данных

| Компонент | Примерный размер |
|-----------|------------------|
| Одна версия Minecraft | ~100-200 МБ |
| Библиотеки (общие) | ~500 МБ |
| Ресурсы одной версии | ~200-400 МБ |
| Метаданные | ~50 МБ |
| **Всего для 5-10 версий** | **~3-5 ГБ** |

## Устранение неполадок

### Игра не запускается, ошибки загрузки

1. Проверьте логи PrismLauncher
2. Убедитесь, что HTTP сервер запущен:
```bash
curl http://localhost:8080/libraries/
```

3. Проверьте права доступа к файлам:
```bash
ls -la /path/to/mirror/
```

### 404 Not Found для некоторых файлов

- Возможно, эти файлы не были загружены
- Временно включите интернет и запустите игру
- Файлы загрузятся автоматически
- Скопируйте их в зеркало

### Медленная работа

- Используйте Nginx вместо Python сервера
- Разместите зеркало на SSD диске
- Убедитесь, что нет антивируса, блокирующего доступ

## Альтернативы

### 1. Использование уже существующих зеркал

Некоторые организации поддерживают публичные зеркала:
- Китайские зеркала: BMCLAPI, MCBBS
- Европейские зеркала (проверьте актуальность)

Просто измените URL в BuildConfig на адрес публичного зеркала.

### 2. Docker контейнер с зеркалом

Можно упаковать всё в Docker образ для простого развёртывания:

```dockerfile
FROM nginx:alpine
COPY libraries/ /usr/share/nginx/html/libraries/
COPY assets/ /usr/share/nginx/html/resources/
COPY meta/ /usr/share/nginx/html/meta/
COPY nginx.conf /etc/nginx/conf.d/default.conf
```

### 3. Использование кэширующего прокси

Настройте кэширующий прокси (Squid, Polipo), который будет:
- При наличии интернета - загружать и кэшировать файлы
- При отсутствии - отдавать из кэша

## Безопасность

⚠️ **Важно:**
- Локальный HTTP сервер не имеет шифрования
- Не открывайте порт в интернет без защиты
- Используйте только в доверенной локальной сети
- Для публичного доступа настройте HTTPS с Let's Encrypt

## Заключение

После настройки локального зеркала PrismLauncher сможет:
✅ Запускать любые ранее загруженные версии Minecraft
✅ Работать полностью автономно
✅ Обслуживать несколько компьютеров в локальной сети
❌ Загружать новые версии (требуется интернет для синхронизации)

Для вопросов и предложений создайте Issue в репозитории проекта.
