#!/bin/bash

if [ "$(ls -A /u01/app/oracle/oradata/xe/ORAUSER.dbf)" ]; then
	echo "found /u01/app/oracle/oradata/xe/ORAUSER.dbf -> orauser tablespace exists"
else
	echo "ORAUSER Tablespace not created. Initializing Tablespace."
	su -c "$SQLPLUS '/ as sysdba' @/u01/app/oracle/create.sql" oracle
	touch $TABLESPACE_CREATED
fi
