# NX769J Recovery GitHub Actions repo

Готовый шаблон репозитория для сборки recovery через GitHub Actions без собственного сервера.

## Что внутри

- `device/nubia/NX769J` — device tree с внесённым decrypt patch stage00
- `.github/workflows/build-recovery.yml` — workflow ручного запуска
- `scripts/dispatch_workflow.sh` — запуск сборки через GitHub API
- `scripts/list_runs.sh` — просмотр последних запусков
- `scripts/download_artifacts.sh` — скачивание артефактов конкретного запуска

## Что делать

1. Создай новый GitHub repository.
2. Распакуй этот архив.
3. Залей все файлы в корень репозитория.
4. Открой вкладку `Actions` и включи workflow, если GitHub попросит это сделать.
5. Запусти workflow вручную:
   - через вкладку `Actions`
   - или через `scripts/dispatch_workflow.sh`

## Быстрый запуск через веб

- Repo -> `Actions`
- Выбери `Build NX769J Recovery`
- Нажми `Run workflow`
- Оставь значения по умолчанию

## Быстрый запуск через API

Создай Personal Access Token с правами на репозиторий и Actions.

Пример:

```bash
bash scripts/dispatch_workflow.sh OWNER REPO YOUR_TOKEN main
```

Проверить статусы:

```bash
bash scripts/list_runs.sh OWNER REPO YOUR_TOKEN
```

Скачать артефакты:

```bash
bash scripts/download_artifacts.sh OWNER REPO YOUR_TOKEN RUN_ID
```

## Важные замечания

- По умолчанию workflow использует:
  - manifest: `https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git`
  - branch: `twrp-12.1`
  - lunch: `twrp_NX769J-eng`
- Если сборка упадёт, первым делом открой `build.log` в артефактах.
- Самые частые причины падения:
  - не хватает зависимостей в manifest
  - device tree ожидает дополнительные vendor blobs
  - нужен другой branch manifest
  - нужен дополнительный common tree

## Что менять при необходимости

Открыть `.github/workflows/build-recovery.yml` и изменить inputs по умолчанию:
- `manifest_url`
- `manifest_branch`
- `device_path`
- `lunch_target`
- `build_target`

## Текущий stage

Это архив стадии `stage00`.
