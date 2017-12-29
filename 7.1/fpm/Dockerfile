FROM xutl/php:7.1-fpm

LABEL maintainer="xutongle@gmail.com"

# Environment settings
ENV PATH=/app:/app/vendor/bin:$PATH

RUN set -xe \
	&& cd /usr/local/src \
	&& curl -fSL http://pecl.php.net/get/msgpack-2.0.2.tgz -o msgpack-2.0.2.tgz \
	&& tar zxf msgpack-2.0.2.tgz \
	&& rm -rf msgpack-2.0.2.tgz \
	&& cd msgpack-2.0.2 \
	&& phpize \
	&& ./configure \
	&& make -j "$(nproc)" \
	&& make install \
	&& rm -rf /usr/local/src/msgpack-2.0.2 \
	&& echo "extension=msgpack.so" >> ${PHP_INI_DIR}/php/msgpack.ini