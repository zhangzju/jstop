
$window = New-Object -ComObject WScript.shell
$wmi = Get-NetAdapter
foreach ($adapter in $wmi)
{
Write-Host $adapter.Name
if ($adapter.status -eq 'Disabled' )
{$window.popup($adapter.name,5,"interface",1+64)}

}