#!/bin/bash

cd /var/www/html/condominio

echo "Copying the configuration example file"
cp .env.example .env

echo "Install dependencies"
composer install

echo "Generate key"
php artisan key:generate

echo "Apply permissions to project folder"
chmod -R 777 /var/www/html/