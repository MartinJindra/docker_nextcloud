#!/bin/bash

# nginx configuration
mkdir -p /opt/docker-files/nginx-proxy/
echo "allow all;" >> /opt/docker-files/nginx-proxy/network_internal.conf
echo "client_max_body_size 10G;" >> /opt/docker-files/nginx-proxy/uploadsize.conf
