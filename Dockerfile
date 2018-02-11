ARG PHP_BASE_IMAGE_VERSION
FROM xutongle/php:${PHP_BASE_IMAGE_VERSION}

LABEL maintainer="xutongle@gmail.com"

# Environment settings
ENV PATH=/app:/app/bin:/app/vendor/bin:$PATH

# Add configuration files
ADD docker-entrypoint /usr/local/bin/docker-entrypoint

RUN set -xe \
	&& mkdir /app \
	&& chown -R www-data:www-data /app

ENTRYPOINT ["docker-entrypoint"]

WORKDIR /app
