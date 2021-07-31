
# 如果有自定义的配置文件；使用自定义的配置文件启动

set -e

if test -e /nginx_temp/nginx.conf;then
	cp -f /nginx_temp/nginx.conf /usr/local/nginx/conf/mynginx.conf
	/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/mynginx.conf
else
	# 如果没有找到配置文件就退出
	return 1
fi

:<<BLOCK
1、容器启动的第一个进程是start.sh的进程，pid为1；
2、docker在pid为1的进程结束后，就会退出。
3、可以在start.sh执行结束后，创建子进程：vi keep_run.temp
只要子进程不退出；start.sh的进程也不会退出

4、注意：
dockre attch contain_id
进入容器后直接进入vi keep_run.temp；这时候只要退出，nginx就会退出。
这个是这个镜像的一个瑕疵。可以使用
docker exec -it contain_id /bin/bash
进入容器做操作来规避
BLOCK

vi keep_run.temp




