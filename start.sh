#!/bin/bash
set -e
python manage.py collectstatic --noinput
exec gunicorn mcm_admission.wsgi --bind 0.0.0.0:$PORT --log-file -

