#Eerst moet de Microsoft Exchange Online Powershell Module geinstalleerd worden, guide: https://technet.microsoft.com/en-us/library/mt775114(v=exchg.160).aspx
$user = Read-Host "Wat is het e-mailadres waarmee je je wilt aanmelden?"
Connect-EXOPSSession -UserPrincipalName $user
#Voor duitsland moeten er 2 extra param's gespecifieerd worden, namelijk -ConnectionUri en -AzureADAuthorizationEndPointUri
#Connect-EXOPSession -UserPrincipalName $user -ConnectionUri Https://outlook.office.de/PowerShell-LiveID -AzureADAuthorizationEndPointUri https://login.microsoftonline.de/common