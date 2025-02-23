# Собрка  

```bash
docker build -t github-runner
```

# Запуск

### `USER_REPOS_NAME` может указываться определеный = `username/repository_name`,либо же на всю организацию = `organisation_name`

```Dockerfile
docker run -d \
    -e USER_REPOS_NAME=your-runner-name \
    -e RUNNER_TOKEN=your-runner-token \
    github-runner
```

## Запуск докера с пробросом докера на докер и перезапуском после перезагрузки

```Dockerfile
docker run -d \
  --name github-runner \
  --restart unless-stopped \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e USER_REPOS_NAME=my-org/my-repo \
  -e RUNNER_TOKEN=your-token \
  github-runner
```
