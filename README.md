# NX769J Recovery GitHub Actions repo

Шаблон репозитория для сборки recovery через GitHub Actions на новой базе TWRP 14.1.

## Что внутри

- `device/nubia/NX769J` — device tree NX769J, очищенный от старых runtime shim-костылей для базы 12.1
- `.github/workflows/build-recovery.yml` — workflow ручного запуска
- `scripts/dispatch_workflow.sh` — запуск сборки через GitHub API
- `scripts/list_runs.sh` — просмотр последних запусков
- `scripts/download_artifacts.sh` — скачивание артефактов конкретного запуска

## Что делать

1. Создай новый GitHub repository или обнови текущий.
2. Распакуй этот архив.
3. Залей все файлы в корень репозитория.
4. Открой вкладку `Actions` и включи workflow.
5. Запусти `Build NX769J Recovery`.
6. Если сборка упадёт — пришли `build.log`.

## База сборки

По умолчанию workflow использует:
- manifest: `https://github.com/minimal-manifest-twrp/platform_manifest_twrp_lineageos.git`
- branch: `twrp-14.1`
- lunch: `twrp_NX769J-eng`
- build target: `recoveryimage`

## Что изменено для stage02

- workflow переведён на TWRP/LineageOS `twrp-14.1`
- JDK обновлён до `openjdk-17-jdk`
- device tree возвращён к чистой crypto-базе без `/twrp-lib64` shim-библиотек
- удалён вложенный `.git` из `device/nubia/NX769J`, чтобы папка не считалась submodule

## Важное

Это заготовка для переноса на новую базу. Она предназначена как следующий стартовый этап после упора старой базы 12.1 в binder/keymint несовместимость.
