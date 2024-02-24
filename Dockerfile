FROM php:8.2-fpm-alpine

# Install system dependencies
RUN apk --no-cache add \
    git \
    unzip \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    libzip-dev \
    jpegoptim \
    optipng \
    pngquant \
    gifsicle \
    vim \
    curl \
    libxml2-dev \
    zip \
    caddy \
    supervisor \
    oniguruma-dev \
    icu-dev \
    $PHPIZE_DEPS \
    openssl-dev \
    && rm -rf /var/cache/apk/*

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) pdo_mysql mbstring exif pcntl bcmath gd zip intl

# Install PHP Swoole extension
RUN pecl install -o -f swoole \
    && docker-php-ext-enable swoole

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configure supervisor
RUN mkdir -p /etc/supervisor.d/
COPY .docker/supervisord.ini /etc/supervisor.d/supervisord.ini

# Configure caddy
RUN rm /etc/caddy/Caddyfile
COPY .docker/Caddyfile /etc/caddy/

# Setup workdir
WORKDIR /var/www/html/app

# Run services
EXPOSE 80
CMD ["supervisord", "-c", "/etc/supervisor.d/supervisord.ini"]
