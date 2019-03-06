# Base
   echo "** Starting base entrypoint"
   sh /usr/bin/start-base.sh

# nginx
   sed -i  's@ENV_WORKDIR@'"$ENV_WORKDIR"'@g' /etc/nginx/conf.d/default.conf
   if [ "$LOG_SERVER" != "none" ] && [ "$LOG_START" == "true" ]; then
      sed -i  's@error_log /var@#error_log /var@g' /etc/nginx/nginx.conf
      sed -i  's@access_log /var@#access_log /var@g' /etc/nginx/nginx.conf
      sed -i  's@#error_log syslog@error_log syslog@g' /etc/nginx/nginx.conf
      sed -i  's@#access_log syslog@access_log syslog@g' /etc/nginx/nginx.conf
   fi

# php-fpm
   if [ "$LOG_SERVER" != "none" ] && [ "$LOG_START" == "true" ]; then
     sed -i  's@error_log = /var@;error_log = /var@g' /etc/php-fpm.conf
     sed -i  's@;syslog.facility@syslog.facility@g' /etc/php-fpm.conf
   fi

# Server
   echo "** Starting webserver"
   if  [ !-d $ENV_WORKDIR ]; then
	   mkdir $ENV_WORKDIR -p
	   chown nginx:www_data $ENV_WORKDIR
   fi
   php-fpm
   nginx -g 'daemon off;'
   
