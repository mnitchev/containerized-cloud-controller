#!/bin/bash
set -e -x

echo "Extracting pcre..."
tar xzvf nginx/pcre-8.42.tar.gz

echo "Extracting nginx_upload module..."
tar xzvf nginx/nginx-upload-module-2.3.0.tar.gz

echo "Patching upload module"
pushd nginx-upload-module-2.3.0
  #patch < ../nginx/upload_module_new_nginx_support.patch
  patch < ../nginx/upload_module_put_support.patch
popd

echo "Extracting nginx..."
tar xzvf nginx/nginx-1.14.2.tar.gz

echo "Building nginx..."
pushd nginx-1.14.2
  ./configure \
    --prefix="/usr/local/nginx" \
    --with-pcre=../pcre-8.42 \
    --add-module=../nginx-upload-module-2.3.0 \
    --with-http_stub_status_module \
    --with-http_ssl_module

  make
  make install
popd
