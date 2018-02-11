ARG PHP_BASE_IMAGE_VERSION
FROM xutongle/php:${PHP_BASE_IMAGE_VERSION}

LABEL maintainer="xutongle@gmail.com"

# Environment settings
ENV PATH=/app:/app/bin:/app/vendor/bin:$PATH

RUN set -xe \
	&& mkdir /app \
	&& chown -R www-data:www-data /app

WORKDIR /app
