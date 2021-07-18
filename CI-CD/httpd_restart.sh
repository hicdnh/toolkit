echo '----------kill all httpd process----------------'
ps -ef|grep httpd|grep -v grep|awk '{print $2}'|xargs kill -9
ps -ef
echo \n\n
echo ----------restart--------------
httpd
ps -ef

