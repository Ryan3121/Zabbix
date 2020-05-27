Param
(
    [Parameter()][string]$INAME,
    [Parameter()][string]$DBNAME,
    [Parameter()][string]$SRVNAME
)
Import-Module -Name sqlps  


$meta = invoke-sqlcmd "SELECT name, state_desc DatabaseStatus_sysDatabase FROM sys.databases WHERE name = '$DBNAME'" -ServerInstance "$SRVNAME\$INAME"

$meta | Select-Object name,DatabaseStatus_sysDatabase | convertto-json -compress
