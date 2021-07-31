#### 文件说明

```markdown
Dockerfile	
nginx:1.20.1版本；通过源码安装

dockerrm_all	
快捷停止所有容器，并且删除（慎重用）

nginx.conf		
此文件在docker启动的时候，会被复制到docker内作为默认配置文件；
如果被删除，使用nginx默认的配置文件；

start.sh          
启动时，运行nginx

start_docker.sh  
启动nginx容器

```

#### 操作方法

```shell
sudo docker build -t nginx-1.20.1:latest .

修改nginx.conf

sudo ./start_docker host_port contain_port
```

#### 修改配置：
```markdown
修改nginx.conf

sudo docker ps -a

sudo docker restart containner_id
```


#### 其他
```markdown
1、--network host： 
这种配置下-p不生效

2、--network host： 
这个参数在宿主系统是window系列或者mac系列时候，不生效

3、默认的网络是bridge

4、host比bridge效率高
```

#### 注意
默认会将宿主机当前文件夹，挂载到容器的/nginx_temp下