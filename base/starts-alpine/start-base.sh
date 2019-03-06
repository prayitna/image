# Setup Rsyslog
   if [ "$LOG_SERVER" != "none" ]; then
	if [ "$LOG_SERVER" != "127.0.0.1" ]; then
		echo "** Setup rsyslog using $LOG_SERVER"
		echo "*.* @@$LOG_SERVER" > /etc/rsyslog.conf  
	fi
	if [ "$LOG_START" == "true" ]; then
		echo "** Startting rsyslogd "
		rsyslogd
	fi
   fi

# Setup Zabbix
   if [ "$LOG_SERVER" != "none" ]; then
      # rubah logtype ke sistem
      sed -i  's@console@'"$ZBX_LOGTYPE"'@' /usr/bin/docker-entrypoint.sh
      if [ "$ZBX_LOGTYPE" != "console" ]; then
         sed -i  's@--foreground@ @g' /usr/bin/docker-entrypoint.sh
      fi
   else
      # rubah logtype ke file
      sed -i 's@console@file@' /usr/bin/docker-entrypoint.sh
      sed -i 's@# LogFile=@LogFile='"$LOG_FILE"'@g' /etc/zabbix/zabbix_agentd.conf
      sed -i 's@# LogFileSize=1@LogFileSize=1@g' /etc/zabbix/zabbix_agentd.conf
   fi
   if [ "$ZBX_TYPE" != "none" ]; then
      bash /usr/bin/docker-entrypoint.sh $1
   else
      if [ "$1" != "" ]; then
	exec $1
      fi
   fi
