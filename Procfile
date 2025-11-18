web: gunicorn mcm_admission.wsgi --bind 0.0.0.0:$PORT --log-file -
worker: celery -A mcm_admission worker -l info

