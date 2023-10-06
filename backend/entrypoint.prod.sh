#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

## question: why comment the makemigrations out?
# python manage.py makemigrations
# python manage.py migrate --no-input
# python manage.py collectstatic --no-input
python manage.py makemigrations
python manage.py migrate

# gunicorn my_project.wsgi:application --bind 0.0.0.0:8000

exec "$@"