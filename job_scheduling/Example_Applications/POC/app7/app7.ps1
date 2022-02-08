$application = $args[0]
$application_archive = $args[1]
$region = $args[2]

$job_location = "/jobsch/$application/$application_archive"

#Get the parameters from SSM parameter store
$db_server = (aws ssm get-parameter --name "${JOB_LOCATION}/DB_SERVER" --region $region | ConvertFrom-Json).Parameter.Value
$db_user = (aws ssm get-parameter --name "${JOB_LOCATION}/DB_USER" --region $region --with-decryption | ConvertFrom-Json).Parameter.Value
$db_password = (aws ssm get-parameter --name "${JOB_LOCATION}/DB_PASSWORD" --region $region --with-decryption | ConvertFrom-Json).Parameter.Value
$db_name = (aws ssm get-parameter --name "${JOB_LOCATION}/DB_NAME" --region $region | ConvertFrom-Json).Parameter.Value

$table = "test_schema.test_table"

$truncate_query = "TRUNCATE TABLE $table"
Invoke-Sqlcmd -ServerInstance $db_server -Database $db_name -Query $truncate_query -Username $db_user -Password $db_password

Import-CSV .\input.csv -Delimiter "," | ForEach-Object {Invoke-Sqlcmd `
  -Database $db_name -ServerInstance $db_server  -Username $db_user -Password $db_password `
  -Query "insert into $table VALUES ($($_.id),'$($_.description)')" `
  }

$selectquery = "select * from test_schema.test_table"

Invoke-Sqlcmd -ServerInstance $db_server -Database $db_name -Query $selectquery -Username $db_user -Password $db_password
