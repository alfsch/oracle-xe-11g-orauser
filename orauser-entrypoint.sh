#!/bin/bash
./entrypoint.sh &

# Wait for oracle to start, ora_q003_xe seems to be the last process which is started and needed from oracle-xe
until pids=$(pidof ora_q003_xe)
do
	sleep 1
done

# service should be up, check if orauser tablespace exists
if [ "$(ls -A /u01/app/oracle/oradata/xe/ORAUSER.dbf)" ]; then
	echo "found /u01/app/oracle/oradata/xe/ORAUSER.dbf -> orauser tablespace exists"
else
	echo "ORAUSER Tablespace not created. Initializing Tablespace."
	su -c "$SQLPLUS '/ as sysdba' @/u01/app/oracle/create.sql" oracle
	touch $TABLESPACE_CREATED
fi

##
## keep container up until oracle-12c is shutdown
##
wait $(pgrep entrypoint.sh)

