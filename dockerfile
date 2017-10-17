FROM therodan/ubuntu-nginx-phpfpm

RUN yes | pecl install xdebug && \
	echo "zend_extension=/usr/lib/php/20151012/xdebug.so" > /etc/php/7.0/fpm/conf.d/xdebug.ini && \
    echo "xdebug.remote_enable = 1" >> /etc/php/7.0/fpm/conf.d/xdebug.ini && \
    echo "xdebug.remote_autostart = 1" >> /etc/php/7.0/fpm/conf.d/xdebug.ini && \
    echo "xdebug.remote_connect_back = 1" >> /etc/php/7.0/fpm/conf.d/xdebug.ini

COPY conf/php.ini /usr/local/etc/php/php.ini
RUN chmod 400 /usr/local/etc/php/php.ini