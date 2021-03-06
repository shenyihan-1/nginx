﻿#!/bin/bash
#
#auotr:zeng
#Eamil:
#date:
#

# install development tools

yum -y groupinstall "Development Tools"

#pcre (使nginx支持http rewrite模块)
#openssl （使nginx 支持 ssl ）
#zlib （使nginx支持在线压缩）

yum -y install gcc gcc-c++  pcre-devel  openssl-devel  zlib-devel

#create user nginx
 id nginx
if [ $? -ne 0 ];then
groupadd -g 1111 nginx
useradd -M -s /sbin/nologin -g nginx -u 1111 nginx
fi
#install source code 

rpm -qa | grep wget

if [ $? -ne 0 ];then
yum -y install wget 
fi

wget http://nginx.org/download/nginx-1.14.2.tar.gz

tar xf nginx-1.14.2.tar.gz -C /opt

#compile 

cd /opt/nginx-1.14.2/

./configure --group=nginx --user=nginx --prefix=/usr/local/nginx --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --http-client-body-temp-path=/tmp/nginx/client_body --http-proxy-temp-path=/tmp/nginx/proxy --http-fastcgi-temp-path=/tmp/nginx/fastcgi --pid-path=/var/run/nginx.pid --lock-path=/var/lock/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_gzip_static_module --with-pcre 

#install 

make && make install










 
