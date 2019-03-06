# Base
   echo "** Starting base entrypoint"
   sh /usr/bin/start-base.sh


# Syslog Server
   echo "** Starting background rsyslog server"
   rsyslogd -n -f /etc/rsyslogd.conf
