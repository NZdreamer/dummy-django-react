#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

# change to not flush for testing purpose
# python manage.py flush --no-input
python manage.py makemigrations
python manage.py migrate

exec "$@"