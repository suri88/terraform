$db_server = $args[0]
$db_user = $args[1]
$db_password = $args[2]
$db_name = $args[3]

$table = "test_schema.test_table"

$truncate_query = "TRUNCATE TABLE $table"
Invoke-Sqlcmd -ServerInstance $db_server -Database $db_name -Query $truncate_query -Username $db_user -Password $db_password

Import-CSV .\input.csv -Delimiter "," | ForEach-Object {Invoke-Sqlcmd `
  -Database $db_name -ServerInstance $db_server  -Username $db_user -Password $db_password `
  -Query "insert into $table VALUES ($($_.id),'$($_.description)')" `
  }

$selectquery = "select * from test_schema.test_table"

Invoke-Sqlcmd -ServerInstance $db_server -Database $db_name -Query $selectquery -Username $db_user -Password $db_password
