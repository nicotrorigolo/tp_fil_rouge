#!/bin/bash

IP=$(hostname -I | awk '{print $1}')
PORT=:5000
IPPORT=$IP$PORT

if [ "$APP_ENVIRONMENT" = 'DEV' ]; then
    echo "Running Development Server"
    exec flask run -h $IP
else
    echo "Running Production Server"
    #exec gunicorn -b :5000 --access-logfile - --error-logfile - app_name:app
    #exec gunicorn -b 172.17.0.2:5000 debut:app
    exec gunicorn -b $IPPORT --access-logfile - --error-logfile - debut:app
fi