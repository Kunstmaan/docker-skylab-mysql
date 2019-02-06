FROM percona:5.7

ADD backup.sh /scripts/backup.sh
RUN rm -rf /etc/mysql/percona-server.conf.d/mysqld.cnf
ADD mysql-conf.cnf /etc/mysql/conf.d/kuma.cnf
