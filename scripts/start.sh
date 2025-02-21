#!/bin/bash

# Конфигурируем runner
./config.sh --url https://github.com/$USER_REPOS_NAME --token $RUNNER_TOKEN --unattended --replace

# Запускаем runner
./run.sh
