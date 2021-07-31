set -e

:<<BLOCK
1：宿主机端口
2：容器端口
3：镜像名，默认nginx-1.20.1:latest
BLOCK


# 启动参数保存在本地
if ! test -e ./docker_start.log
then
	echo > docker_start.log
fi

echo $(date "+%Y:%m:%d:%H:%M:%S") "\$1":$1 "\$2":$2 configure_path:$(pwd) >> docker_start.log

if test -z $3
then
	__image_name=nginx-1.20.1:latest
else
	__image_name=$3
fi

docker run -itd \
	-v=$(pwd):/nginx_temp:rw \
	--name=nginx \
	-p $1:$2 \
	${__image_name}

docker ps
