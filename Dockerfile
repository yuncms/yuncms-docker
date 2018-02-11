ARG PHP_BASE_IMAGE_VERSION
FROM xutongle/php:${PHP_BASE_IMAGE_VERSION}

LABEL maintainer="xutongle@gmail.com"

# Environment settings
ENV PATH=/app:/app/bin:/app/vendor/bin:$PATH
ENV APP_ENV=Production

# Add configuration files
ADD docker-entrypoint /usr/local/bin/docker-entrypoint

RUN set -xe \
	&& mkdir /app \
	&& chown -R www-data:www-data /app \
	&& chmod 700 /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]

WORKDIR /app
