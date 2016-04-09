#!/usr/bin/env bash

echo "SET autocommit=0;" > /docker-entrypoint-initdb.d/mysql.sql
echo "SET unique_checks=0;" >> /docker-entrypoint-initdb.d/mysql.sql
echo "SET foreign_key_checks=0;" >> /docker-entrypoint-initdb.d/mysql.sql
mysqldump --skip-opt --add-drop-table --add-locks --create-options --disable-keys --single-transaction --skip-extended-insert --quick --set-charset -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE >> /docker-entrypoint-initdb.d/mysql.sql
echo "COMMIT;" > /docker-entrypoint-initdb.d/mysql.sql
echo "SET autocommit=1;" >> /docker-entrypoint-initdb.d/mysql.sql
echo "SET unique_checks=1;" >> /docker-entrypoint-initdb.d/mysql.sql
echo "SET foreign_key_checks=1;" >> /docker-entrypoint-initdb.d/mysql.sql
gzip /docker-entrypoint-initdb.d/mysql.sql -f
