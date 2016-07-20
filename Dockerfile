FROM sath89/oracle-12c
MAINTAINER Alfred Schmid
ENV TNS_ADMIN=$ORACLE_HOME/network/admin
ENV SQLPLUS=$ORACLE_HOME/bin/sqlplus
ENV TABLESPACE_CREATED=./tablespace-created.stat
ADD create.sql /u01/app/oracle
ADD orauser-entrypoint.sh /
ENTRYPOINT ["/orauser-entrypoint.sh"]
CMD [""]
