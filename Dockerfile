FROM php:apache

COPY ./laravel-scripts/install-laravel.sh /install-laravel.sh

RUN apt-get update \
  && apt-get install --yes --no-install-recommends libpq-dev \
  && apt-get install --yes zlib1g-dev \
  && apt-get install --yes libzip-dev \  
  && docker-php-ext-install zip \  
  && docker-php-ext-install pdo_pgsql \
  && apt-get install --yes git \
  && curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
  && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
  && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
  && php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot \
  && rm -f /tmp/composer-setup.* \
  && export DEBIAN_FRONTEND=noninteractive \
	&& apt-get install -y tzdata \
	&& ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime \
	&& dpkg-reconfigure --frontend noninteractive tzdata
