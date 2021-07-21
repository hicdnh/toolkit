#!/bin/bash

__FASTFDS_WORKSPACE=/data/fastfds

# 复制挂载的配置文件到默认目录
cp ${__FASTFDS_WORKSPACE}/*.conf /etc/fdfs/
cp ${__FASTFDS_WORKSPACE}/nginx.conf /usr/local/nginx/conf

echo "start trackerd"
/etc/init.d/fdfs_trackerd start

echo "start storage"
/etc/init.d/fdfs_storaged start

echo "start nginx"
/usr/local/nginx/sbin/nginx 

tail -f  /dev/null
