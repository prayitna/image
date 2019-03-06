# Base
   echo "** Starting base entrypoint"
   sh /usr/bin/start-base.sh

# MySQL
   MYSQL_DATA_DIR="/var/lib/mysql"
   if [ ! -d "$MYSQL_DATA_DIR/mysql" ]; then
        [ -d "$MYSQL_DATA_DIR" ] || mkdir -p "$MYSQL_DATA_DIR"

        chown -R mysql:mysql "$MYSQL_DATA_DIR"

        echo "** Installing initial MySQL database schemas"
        mysql_install_db --user=mysql --datadir="$MYSQL_DATA_DIR" 2>&1
    else
        echo "**** MySQL data directory is not empty. Using already existing installation."
        chown -R mysql:mysql "$MYSQL_DATA_DIR"
    fi

    mkdir -p /var/run/mysqld
    ln -s /var/run/mysqld /run/mysqld
    chown -R mysql:mysql /var/run/mysqld
    chown -R mysql:mysql /run/mysqld

    if [ "$1" == "" ]; then
       echo "** Starting MySQL server in foreground mode"
       mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mysql/plugin \
            --user=mysql --log-output=none --pid-file=/var/lib/mysql/mysqld.pid \
            --port=3306 --character-set-server=utf8 --collation-server=utf8_bin 
    else
       echo "** Starting MySQL server in background mode"
       mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mysql/plugin \
            --user=mysql --log-output=none --pid-file=/var/lib/mysql/mysqld.pid \
            --port=3306 --character-set-server=utf8 --collation-server=utf8_bin &
       exec $1
    fi
