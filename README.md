# dummy-django-react

## Setup

### database

1. create file `.env.prod.db` and put the following in database part of `docker-compose.prod.yml`
```
  db:
    env_file:
      - ./.env.prod.db
```
2. alternatively, put the following directly in `docker-compose.yml`
```
  db:
    environment:
      - POSTGRES_DB=my_database_dev
      - POSTGRES_USER=my_user
      - POSTGRES_PASSWORD=my_password
```

### backend

1. create a Django project
```
django-admin startproject backend
```
2. add files in backend folder: `Dockerfile`, `Dockerfile.prod`, `entrypoint.sh`, `entrypoint.prod.sh` 
3. create `.env.dev` and `.env.prod` in root directory of the whole project
4. in `settings.py`, 
    * add `'corsheaders', 'rest_framework'` in INSTALLED_APPS; 
    ```
    INSTALLED_APPS = [
        ...
    'corsheaders',
    'rest_framework',
    ]
    ```
    * add `"corsheaders.middleware.CorsMiddleware", "django.middleware.common.CommonMiddleware"` in MIDDLEWARE; 
    ```
    MIDDLEWARE = [
    "corsheaders.middleware.CorsMiddleware", 
    "django.middleware.common.CommonMiddleware", 
        ...
    ]
    ```
    * add the following code
    ```
    CORS_ALLOW_ALL_ORIGINS=True
    ``` 
    * `import os`. add the following code
    ```
    STATIC_URL = "/staticfiles/" 
    STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles') 
    ```

### frontend

1. create a React project
```
npx create-react-app frontend
```
2. create files in frontend folder: `Dockerfile`, `Dockerfile.prod`

### nginx

1. create file `Dockerfile`
2. create file `default.conf`

### docker-compose

add docker-compose.yml for development and production: `docker-compose.yml`, `docker-compose.prod.yml`
