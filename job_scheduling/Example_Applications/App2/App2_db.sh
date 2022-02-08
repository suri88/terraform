export DB_USER=$1
export DB_PASSWORD=$2
export DB_HOST=$3
export DB_NAME=$4


export DB_PORT=1521

echo "${DB_USER}/${DB_PASSWORD}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=${DB_HOST})(PORT=${DB_PORT}))(CONNECT_DATA=(SID=${DB_NAME})))"
while read line
do
insertval=$(echo $line | sed "s/ *//g;s/,/','/g;s/^/'/;s/$/'/")
sqlplus -s /nolog<<EOF
connect ${DB_USER}/${DB_PASSWORD}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=${DB_HOST})(PORT=${DB_PORT}))(CONNECT_DATA=(SID=${DB_NAME})))
DROP TABLE sample_tab;
CREATE TABLE sample_tab(COL1 VARCHAR2(40),COL2 varchar2(40));

insert into sample_tab values ($insertval);
commit;
select * from sample_tab;
exit;
EOF
done< input.csv