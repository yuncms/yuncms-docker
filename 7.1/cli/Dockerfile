FROM xutl/php:7.1-cli

LABEL maintainer="xutongle@gmail.com"

# Environment settings
ENV PATH=/app:/app/vendor/bin:$PATH

RUN set -xe \
	&& msgpackVersion=2.0.2\

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

RUN set -xe \
	&& cd /usr/local/src \
	&& curl -o igbinary-${IGBINARY_VERSION}.tgz http://pecl.php.net/get/igbinary-${IGBINARY_VERSION}.tgz \
	&& tar zxf igbinary-${IGBINARY_VERSION}.tgz \
	&& rm -rf igbinary-${IGBINARY_VERSION}.tgz \
	&& cd igbinary-${IGBINARY_VERSION} \
	&& phpize \
	&& ./configure \
	&& make \
	&& make install \
	&& rm -rf /usr/local/src/igbinary-${IGBINARY_VERSION} \
	&& echo "extension=igbinary.so" >> ${PHP_INI_DIR}/php/igbinary.ini

RUN set -xe \
	&& cd /usr/local/src \
	&& curl -o memcached-${MEMCACHED_VERSION}.tgz http://pecl.php.net/get/memcached-${MEMCACHED_VERSION}.tgz \
	&& tar zxf memcached-${MEMCACHED_VERSION}.tgz \
	&& rm -rf memcached-${MEMCACHED_VERSION}.tgz \
	&& cd memcached-${MEMCACHED_VERSION} \
	&& phpize \
	&& ./configure --enable-memcached --enable-memcached-igbinary --enable-memcached-json --enable-memcached-msgpack --with-libdir=lib64 \
	&& make && make install && rm -rf /usr/local/src/memcached-${MEMCACHED_VERSION} && \
    echo "extension=memcached.so" >> ${PHP_INI_DIR}/php/memcached.ini

RUN set -xe \
	&& cd /usr/local/src \
	&& curl -o redis-${REDIS_VERSION}.tgz http://pecl.php.net/get/redis-${REDIS_VERSION}.tgz && \
	tar zxf redis-${REDIS_VERSION}.tgz && rm -rf redis-${REDIS_VERSION}.tgz && cd redis-${REDIS_VERSION} && \
	phpize && ./configure --enable-redis --enable-redis-igbinary && make && make install && \
	rm -rf /usr/local/src/redis-${REDIS_VERSION} && \
	echo "extension=redis.so" >> ${PHP_INI_DIR}/php/redis.ini

RUN set -xe \
	&& cd /usr/local/src \
	&& curl -o yaml-${YAML_VERSION}.tgz http://pecl.php.net/get/yaml-${YAML_VERSION}.tgz && \
	tar zxf yaml-${YAML_VERSION}.tgz && rm -rf yaml-${YAML_VERSION}.tgz && cd yaml-${YAML_VERSION} && \
	phpize && ./configure && make && make install && rm -rf /usr/local/src/yaml-${YAML_VERSION} && \
	echo "extension=yaml.so" >> ${PHP_INI_DIR}/php/yaml.ini

