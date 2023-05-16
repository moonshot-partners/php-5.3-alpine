FROM cespi/php-5.3:apache-latest
RUN apk update
RUN apk add bash libjpeg-turbo-dev libpng-dev gcc make autoconf pkgconfig g++ zlib zlib-dev libmemcached-dev cyrus-sasl-dev libsasl cyrus-sasl mariadb-dev
RUN pecl install apcu-4.0.11 uploadprogress-0.3.0
RUN docker-php-ext-install mysqli pdo_mysql pdo gd 
RUN docker-php-ext-enable mysqli
RUN docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr/include 
RUN echo "extension=apcu.so" >> /usr/local/etc/php/conf.d/php.ini
RUN echo "extension=uploadprogress.so" >> /usr/local/etc/php/conf.d/php.ini
RUN echo "apc.rfc1867 = 1" >> /usr/local/etc/php/conf.d/php.ini
RUN docker-php-ext-install gd

COPY . /var/www/html
EXPOSE 80
