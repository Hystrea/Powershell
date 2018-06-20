# Inloggen Office 365
$LiveCred = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $LiveCred -Authentication Basic -AllowRedirection
Import-PSSession $Session
# Naam van de gebruiker 
$Name = "naam van de gebruiker in Office 365"
# Script 
# Get-Mailbox -Identity $Name | Set-Mailbox -LitigationHoldEnabled $true -LitigationHoldDuration 180

#### Voor toevoegen retentie policy op alle users, gebruik de code hieronder ####

# Get-Mailbox -ResultSize Unlimited -Filter {RecipientTypeDetails -eq "UserMailbox"} | Set-Mailbox -LitigationHoldEnabled $true -LitigationHoldDuration 180