#!/bin/bash

echo "Enter project directory"
cd ../html/

echo "Create laravel project"
composer create-project --prefer-dist laravel/laravel condominio

echo "Uploading Application container"
docker-compose up -d

echo "Apply permission to run laravel installation script"
docker exec condominio-app chmod 777 /install-laravel.sh

echo "Execute laravel installation"
docker exec condominio-app /install-laravel.sh
