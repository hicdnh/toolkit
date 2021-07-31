FROM centos:7
WORKDIR /
ADD start.sh start.sh
ARG ver=1.20.1
EXPOSE 80
RUN set -e \
	&& chmod +x start.sh \
	&& mkdir nginx \
	&& mkdir nginx_temp \
	&& yum install net-tools wget gcc gcc-c++ make automake autoconf pcre pcre-devel zlip zlib-devel openssl openssl-devel libtool -y \
	&& cd nginx \
	&& wget http://nginx.org/download/nginx-${ver}.tar.gz \
	&& tar -zxvf nginx*tar.gz \
	&& cd nginx-${ver} \
	&& ./configure \
	&& make && make install
ENTRYPOINT ["sh", "start.sh"]
	
