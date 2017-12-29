FROM xutl/php:7.2-fpm-xenial

MAINTAINER XUTONGLE <xutongle@gmail.com>

# Environment settings
ENV PATH=/app:/app/vendor/bin:$PATH

ENV NGINX_INI_DIR=/usr/local/etc/nginx

RUN apt-get update && apt-get install -y supervisor libgd-dev --no-install-recommends && \
    rm -r /var/lib/apt/lists/*

ARG NGINX_VERSION=1.13.7

RUN cd /usr/local/src && curl -o /usr/local/src/nginx-${NGINX_VERSION}.tar.gz http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz && \
    tar zxf nginx-${NGINX_VERSION}.tar.gz && rm -rf nginx-${NGINX_VERSION}.tar.gz && cd nginx-${NGINX_VERSION}/ && \
    ./configure --prefix=/usr/local --conf-path=${NGINX_INI_DIR}/nginx.conf --error-log-path=/var/log/nginx/error.log \
    --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
    --http-log-path=/var/log/nginx/access.log --http-proxy-temp-path=/var/lib/nginx/proxy \
    --lock-path=/run/lock/nginx.lock --pid-path=/run/nginx.pid --with-http_ssl_module --with-http_v2_module \
    --with-http_image_filter_module --with-http_slice_module --with-http_xslt_module --with-http_realip_module \
    --with-http_stub_status_module --with-pcre --with-pcre-jit --with-http_flv_module --with-http_mp4_module \
    --with-http_addition_module --with-threads --with-http_secure_link_module --with-http_degradation_module \
    --with-http_ssl_module --with-http_gzip_static_module --without-mail_imap_module --without-mail_pop3_module \
    --without-mail_smtp_module --without-http_uwsgi_module --without-http_scgi_module --without-select_module \
    --with-http_sub_module --with-cc-opt='-O2' && make && make install && mkdir -p /var/lib/nginx && \
    rm -rf /usr/local/src/nginx-${NGINX_VERSION}

# Add configuration files
COPY image-files/ /

ADD run.sh /run.sh

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log && chmod 700 /run.sh

EXPOSE 80
EXPOSE 443

CMD ["/run.sh"]