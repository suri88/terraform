export APPLICATION=$1
export JOB_NAME=$2
export REGION=$3


export JOB_LOCATION="/jobsch/${APPLICATION_NAME}/${APPLICATION_ZIP_NAME}"
echo $JOB_LOCATION

#Get the parameters from SSM parameter store
export DB_USER=`aws ssm get-parameter --name "${JOB_LOCATION}/DB_USER" --region ${REGION} --with-decryption | jq -r .Parameter.Value`
export DB_PASSWORD=`aws ssm get-parameter --name "${JOB_LOCATION}/DB_PASSWORD" --region ${REGION} --with-decryption | jq -r .Parameter.Value`
export DB_HOST=`aws ssm get-parameter --name "${JOB_LOCATION}/DB_HOST" --region ${REGION}  | jq -r .Parameter.Value`
export DB_NAME=`aws ssm get-parameter --name "${JOB_LOCATION}/DB_NAME" --region ${REGION}  | jq -r .Parameter.Value`
export DB_PORT=`aws ssm get-parameter --name "${JOB_LOCATION}/DB_PORT" --region ${REGION}  | jq -r .Parameter.Value`

echo "DB user : ${DB_USER}"

echo "Failing the job for testing notifications"
exit 1


#echo "${DB_USER}/${DB_PASSWORD}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=${DB_HOST})(PORT=${DB_PORT}))(CONNECT_DATA=(SID=${DB_NAME})))"
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
