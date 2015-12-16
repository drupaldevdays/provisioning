#!/bin/sh
set -e
errors=$({{ php7-src.prefix }}/sbin/php-fpm --fpm-config {{ php7-src.prefix }}/etc/php-fpm.conf -t 2>&1 | grep "\[ERROR\]" || true);
if [ -n "$errors" ]; then
    echo "Please fix your configuration file…"
    echo $errors
    exit 1
fi
exit 0
