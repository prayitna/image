FROM kusprayitna/base:alpine


RUN	apk add mysql mysql-client rsyslog --no-cache \ 	
	&& rm /var/cache/apk/* -f

VOLUME 	/var/lib/mysql
	
ENV 	ENV_LOGSERVER -
ENV 	MYSQL_ROOT_PASSWORD -

COPY    settings /etc
COPY	starts /etc

EXPOSE	3306

ENTRYPOINT ["sh","/etc/start.sh"]
