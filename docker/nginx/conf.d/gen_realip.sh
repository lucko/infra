#!/bin/sh
rm cloudflare_realip.conf

for cfip in `curl -s https://www.cloudflare.com/ips-v4`; do echo "set_real_ip_from $cfip;" >> cloudflare_realip.conf; done
for cfip in `curl -s https://www.cloudflare.com/ips-v6`; do echo "set_real_ip_from $cfip;" >> cloudflare_realip.conf; done

echo "" >> cloudflare_realip.conf
echo "real_ip_header CF-Connecting-IP;" >> cloudflare_realip.conf
