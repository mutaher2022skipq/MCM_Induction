#!/bin/bash
set -e
echo "Running collectstatic..."
python manage.py collectstatic --noinput
echo "Collectstatic completed. Starting Gunicorn..."
exec gunicorn mcm_admission.wsgi --bind 0.0.0.0:$PORT --log-file -

