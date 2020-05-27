#Disc script

#Get clustered instance name
$cherrycoke = get-service -name "MSSQL$*"
$tango = $cherrycoke | Select-Object -expandProperty Name
$fanta = $tango.replace("MSSQL$","")

#Get the server name (Test2) 
$irnbru = Get-Cluster | Get-ClusterResource | ? ResourceType -eq "Network Name"  | ? Name -like "*SQL Network Name*" | Select-Object -expandproperty Name
$tizer = $irnbru.replace("SQL Network Name (","")
$sprite = $tizer.replace(")","")

#Query SQL to get the DB names
$super = Invoke-Sqlcmd -Query "select name from sys.databases" -ServerInstance "$sprite\$fanta"
$error404 = New-Object -TypeName PSObject -Property @{data = @($super| select-object  -Property @{Name="{#NAME}";Expression={$_.Name}})}
$vimto = $super | Select-Object name -expandproperty name

$lucozade = foreach ($vimt in $vimto) {
"{""{#SRVNAME}"":""$sprite"",""{#INAME}"":""$fanta"",""{#DBNAME}"":""$vimt""},"
} 

$cup = $lucozade | ConvertTo-Json -compress 

$datas = "{""data"":["

$fantafruittwist = $datas + $lucozade
 
 $fantafruittwist=  $fantafruittwist.trimend(',')

 $fantafruittwist + ']}'
