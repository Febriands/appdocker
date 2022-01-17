#!/bin/sh

python manage.py makemigrations --no-input
python manage.py migrate --no-input
python manage.py collectstatic --no-input

DJANGO_SUPERUSER_USERNAME=admin \
DJANGO_SUPERUSER_PASSWORD=admin \
DJANGO_SUPERUSER_EMAIL=admin@admin.com \
python manage.py createsuperuser --noinput

gunicorn website.wsgi:application --bind 0.0.0.0:8014