FROM 	kusprayitna/base:oraclelinux

COPY	sources  /tmp
COPY	setup	 /etc
RUN	groupadd -g 82  www-data && useradd -u 82 -g  www-data nginx \		
	&& yum install /tmp/oracle-instantclient12* php php-fpm nginx php-oci8-12c \
	php-json php-mysql php-mbstring php-gd -y \
	&& mkdir -p /var/lib/php/session && mkdir -p /var/lib/php/wsdlcache \
	&& chown nginx:www-data /var/lib/php/session && chown nginx:www-data /var/lib/php/wsdlcache \
	&& rm /tmp/* -f && rm /home/nginx -rf && mkdir /home/www && chown nginx:www-data /home/www

ENV     LD_LIBRARY_PATH='/usr/lib/oracle/12.2/client64/lib/'
ENV	ENV_WORKDIR='/home/www'
ENV     LOG_SERVER='127.0.0.1'
ENV	LOG_START='false'
ENV	ZBX_TYPE='none'


COPY    settings /etc
COPY 	starts/start.sh /etc
EXPOSE	80

ENTRYPOINT ["sh","/etc/start.sh"]
            
