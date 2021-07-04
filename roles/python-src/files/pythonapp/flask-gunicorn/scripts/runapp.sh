#!/bin/sh
gunicorn --name "mypythonapp" --chdir /app/src --bind 0.0.0.0:3000 app:application gevent --worker-connections 1000 --workers 4 --log-level=debug
