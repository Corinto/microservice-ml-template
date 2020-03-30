#! /bin/bash
#
# shell script to start the service
#
set -ex

export PYTHONPATH=$PYTHONPATH:/app/src

#Authenticate service account
#Only used when running the docker container locally.
#The google service key is added at runtime 
#using docker run --env-file flag

#touch service-key.json
#echo $SERVICE_ACCOUNT_KEY > service-key.json
#gcloud auth activate-service-account $SERVICE_ACCOUNT_EMAIL --key-file=service-key.json
#rm service-key.json


# Paths for the service and app
export GUNICORN_CONF=/app/src/service/gunicorn_conf.py
export APP_MODULE=src.service.app:app

exec gunicorn -k uvicorn.workers.UvicornWorker -c "$GUNICORN_CONF" "$APP_MODULE"