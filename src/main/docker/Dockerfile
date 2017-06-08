FROM sath89/oracle-12c
MAINTAINER Alfred Schmid
ENV TNS_ADMIN=$ORACLE_HOME/network/admin
ENV SQLPLUS=$ORACLE_HOME/bin/sqlplus
ENV TABLESPACE_CREATED=./tablespace-created.stat
ENV PATH "$PATH:/u01/app/oracle/product/12.1.0/xe/bin/"
COPY create.sql /u01/app/oracle
COPY 00-create-user-tablespace.sh /docker-entrypoint-initdb.d/
# don't make oracle installation part from image.
VOLUME ["/u01/app/oracle-product"]
CMD [""]
