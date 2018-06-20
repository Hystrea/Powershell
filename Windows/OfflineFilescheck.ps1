<#
Opzet:

$sync = Get-syncstatus (https://blogs.technet.microsoft.com/heyscriptingguy/2009/06/01/hey-scripting-guy-how-can-i-work-with-the-offline-files-feature-in-windows/)

if ($sync.days -ge 3 days){

Generate a warning

}
elseif ($sync.days -ge 5 days){

Generate an error

}
else{

do nothing
}
#>

$sync = Get-WmiObject -Class Win32_OfflineFilesConnectionInfo | select -expand ConnectState
$offline = Get-WmiObject -Class Win32_OfflineFilesConnectionInfo | select -expand OfflineReason
if ($Sync -eq $False){

write-host "Generating a warning..... the offline reason is $($offline)"

}

Else {

write-host "The connect state is $($Sync.ConnectState)"
}