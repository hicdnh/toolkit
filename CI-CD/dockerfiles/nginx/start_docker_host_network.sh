set -e

:<<BLOCK
\$1: 默认nginx-1.20.1:latest，如果其他镜像需要填写

网络模式：
--network host 

这种模式下，不用加-p参数，做容器和宿主机端口映射。
并且这种方式比较推荐：
1、通信效率高
2、同一台机器的容器，即使使用不同虚拟网卡，也能通信；如果是桥接，是不行的

BLOCK


# 启动参数保存在本地
if ! test -e ./docker_start.log
then
	echo > docker_start.log
fi

echo $(date "+%Y:%m:%d:%H:%M:%S") "\$1":$1  configure_path:$(pwd) >> docker_start.log

if test -z $1
then
	__image_name=nginx-1.20.1:latest
else
	__image_name=$1
fi

docker run -itd \
	-v=$(pwd):/nginx_temp:rw \
	--name=nginx \
	--network host \
	${__image_name}

docker ps
