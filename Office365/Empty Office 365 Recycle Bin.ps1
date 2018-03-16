### Logt in op O365 services ###
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
$CRED = Get-Credential
$SESSION = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell -Credential $CRED -Authentication Basic -AllowRedirection
Import-PSSession $SESSION
Connect-MsolService -Credential $CRED
# Verwijdert alle users in de O365 recycle bin.
Get-MsolUser -ReturnDeletedUsers | Remove-MsolUser -RemoveFromRecycleBin -Force