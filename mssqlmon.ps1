Import-Module -Name sqlserver   
$paths = (gci SQLSERVER:\sql\$env:COMPUTERNAME\)
$dave = foreach ($p in $paths){$p.databases |? IsSystemObject -ne True | select Name,Status}
$Result = New-Object -TypeName PSObject -Property @{data = @($dave | select-object  -Property @{Name="{#NAME}";Expression={$_.Name}}, @{Name="{#STATUS}";Expression={$_.status}})} 
ConvertTo-Json -InputObject $Result -Compress  
