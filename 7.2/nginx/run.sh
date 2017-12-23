#!/bin/bash

set -e -x

function setEnvironmentVariable() {
    if [ -z "$2" ]; then
            echo "Environment variable '$1' not set."
            return
    fi
    echo "env[$1] = \"$2\" ; automatically add env" >> /usr/local/etc/php-fpm.d/www.conf
}

sed -i '/automatically add env/d' /usr/local/etc/php-fpm.d/www.conf

# Grep all ENV variables
for _curVar in `env | awk -F = '{print $1}'`;do
    # awk has split them by the equals sign
    # Pass the name and value to our function
    setEnvironmentVariable ${_curVar} ${!_curVar}
done

supervisord -n
# service supervisord start