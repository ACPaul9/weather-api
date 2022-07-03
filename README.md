# Weather API

### Описание

Проект выполнен в рамках выполнения тестового задания

### Environment requirements

```
Docker installed
```

### Первый запуск

* Готовим окружение

```
cp docker-compose.override.yml.sample docker-compose.override.yml
```

Прописываем в `docker-compose.override.yml` значение api-ключа, полученного на [accuweather](https://developer.accuweather.com/apis)

* Запускаем приложение

```
docker compose up
```

Документация в swagger формате находится в файле `swagger/swagger.yml`, для отображения можно использовать [Swagger Editor](https://editor.swagger.io/)
