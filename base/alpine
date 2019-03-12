FROM 	zabbix/zabbix-agent:alpine-latest

RUN	apk update && apk upgrade && apk add rsyslog --no-cache

ENV     ZBX_LOGTYPE='system'
ENV	LOG_START='true'
ENV     LOG_SERVER='127.0.0.1'
ENV	LOG_FILE='/var/log/messages'	

WORKDIR /

COPY	starts-alpine /usr/bin/

ENTRYPOINT	["sh","/usr/bin/start-base.sh","sh"]
