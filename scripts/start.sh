#!/bin/bash

# Конфигурируем runner
./config.sh --url https://github.com/DANTECK-dev/$REPOS_NAME --token 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 --unattended --replace

# Запускаем runner
./run.sh
