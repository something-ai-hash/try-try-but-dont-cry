FROM php:7.4-apache

RUN apt-get update && \
    apt-get install -y libpng-dev libjpeg-dev libpq-dev && \
    docker-php-ext-configure gd --with-jpeg=/usr/include/ && \
    docker-php-ext-install gd pdo pdo_mysql pdo_pgsql mysqli opcache && \
    pecl install redis && \
    docker-php-ext-enable redis && \
    rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite && \
    sed -i 's!/var/www/html!/var/www/html/wordpress!g' /etc/apache2/sites-available/000-default.conf && \
    sed -i 's!/var/www/html!/var/www/html/wordpress!g' /etc/apache2/sites-available/default-ssl.conf && \
    sed -i 's!/var/www/!/var/www/html/wordpress!g' /etc/apache2/apache2.conf && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf

WORKDIR /var/www/html/wordpress

COPY wordpress/ .

RUN chown -R www-data:www-data .

EXPOSE 80

CMD ["apache2-foreground"]