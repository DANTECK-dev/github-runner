# Запуск 
# docker build -t github-runner .
# docker run -e REPOS_NAME=your-runner-name -e RUNNER_TOKEN=your-runner-token github-runner


# Используем официальный образ Ubuntu
FROM ubuntu:24.04

# Устанавливаем аргумент версии GitHub Runner
ARG RUNNER_VERSION=2.322.0

# Отключаем интерактивный режим
ENV DEBIAN_FRONTEND=noninteractive

# Устанавливаем необходимые пакеты
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl unzip jq git build-essential libssl-dev libffi-dev python3 python3-venv python3-dev python3-pip \
    libicu-dev \
    && rm -rf /var/lib/apt/lists/*

# Создаём пользователя runner
RUN useradd -m runner

# Переходим в директорию runner и загружаем GitHub Actions Runner
WORKDIR /home/runner
RUN mkdir actions-runner && cd actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

# Устанавливаем зависимости
RUN /home/runner/actions-runner/bin/installdependencies.sh

# Копируем скрипт запуска
COPY scripts/start.sh /home/runner/start.sh
RUN chmod +x /home/runner/start.sh

# Меняем владельца файлов на пользователя runner
RUN chown -R runner:runner /home/runner

# Устанавливаем пользователя runner для всех следующих команд
USER runner

# Устанавливаем рабочую директорию
WORKDIR /home/runner/actions-runner

# Определяем точку входа
ENTRYPOINT ["/home/runner/start.sh"]
