#!/bin/bash

# touch /etc/nginx/tls/server.key
# touch /etc/nginx/tls/server.crt
# cat SERVER_KEY_PATH > /etc/nginx/tls/server.key
# cat SERVER_CRT_PATH > /etc/nginx/tls/server.crt

nginx -g "daemon off;"
