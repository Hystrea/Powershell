﻿ Import-Module MSonline
    # Capture administrative credentials.
        Write-Host "Enter credentials of the tenant you want information from:" -BackgroundColor Green -ForegroundColor Black
        $Credential = Get-Credential
    # Establishes Online Services connection to Azure Active Directory.
        Write-Host "Connecting to Microsoft Online Services..." -BackgroundColor Green -ForegroundColor Black
        Connect-MsolService -Credential $Credential
    # Import Microsoft.Exchange PSSession for Exchange Online cmdlets.
        $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $Credential -Authentication Basic -AllowRedirection 
        Import-PSSession $Session -AllowClobber 3> $null

$gebruikers = Get-Mailbox -ResultSize Unlimited

foreach ($gebruiker in $gebruikers){
write-host "Disabling clutter for $gebruiker" -ForegroundColor Green
Set-Clutter -Enable $false
}