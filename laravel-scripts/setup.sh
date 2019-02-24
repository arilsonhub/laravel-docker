#!/bin/bash

echo "Create laravel project"
composer create-project --prefer-dist laravel/laravel <your-app>

echo "Uploading Application container"
docker-compose up -d

echo "Apply permission to run laravel installation script"
docker exec <your-app>-app chmod 777 /install-laravel.sh

echo "Execute laravel installation"
docker exec <your-app>-app /install-laravel.sh
