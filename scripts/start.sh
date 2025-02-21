#!/bin/bash

# Конфигурируем runner
./config.sh --url https://github.com/DANTECK-dev/$REPOS_NAME --token $RUNNER_TOKEN --unattended --replace

# Запускаем runner
./run.sh
