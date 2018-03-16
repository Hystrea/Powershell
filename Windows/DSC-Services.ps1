$GetService = Get-Service | select DisplayName,Name,StartType
$CSV = @"
DisplayName,Name,StartType
DNS Server,DNS,Automatic
DHCP Server,DHCP,Automatic
Backup Service Controller,Backup Service Controller,Automatic
Remote Desktop Gateway,TSGateway,Automatic
"@

$Base = ConvertFrom-Csv -InputObject $CSV

ForEach ($Service in $GetService){
ForEach ($State in $Base){
 
if ($State.StartType -ne $Service.StartType -and $State.DisplayName -eq $Service.DisplayName){

Write-Host $Service.DisplayName state is $Service.StartType and should be $State.StartType

#Set-Service -DisplayName $Service.DisplayName -StartupType Automatic
#Start-Service -DisplayName $Service.DisplayName -Force -verbose

 
}}}