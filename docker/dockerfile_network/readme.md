

#### 1、配置文件
放在/data/fastfds内

#### 2、启动方式
这里的参数是示意，具体看配置文件

-p 8080:80
8080、8089是host端口；这里的端口是示意，具体根据自己的配置文件配置
```
docker exec -p 8089:80 \
	    -p 8080:80 \
 	    -v /host_data/fastfds:/data/fastfds \
 	    -itd image_id /bin/bash
```
